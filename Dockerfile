FROM rust:1.92-slim-bookworm AS builder

RUN apt-get update && apt-get install -y \
    pkg-config \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# 依照預設值安裝 features
# RUN cargo install sqlx-cli

# 為了縮小 image size 只安裝 postgres 相關 features
RUN cargo install sqlx-cli --no-default-features --features native-tls,postgres

# 移除調試符號
RUN strip /usr/local/cargo/bin/sqlx

# 使用 google distroless
FROM gcr.io/distroless/cc-debian12

COPY --from=builder /usr/local/cargo/bin/sqlx /usr/local/bin/sqlx

CMD ["sqlx", "--version"]
