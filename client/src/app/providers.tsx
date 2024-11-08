// src/app/providers.tsx
'use client'

import { WagmiProvider, createConfig } from 'wagmi'
import { ConnectKitProvider, getDefaultConfig } from "connectkit";
import { sepolia, hardhat } from 'wagmi/chains'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'

const chains = [sepolia, ...(process.env.NEXT_PUBLIC_ENABLE_TESTNETS === 'true' ? [hardhat] : [])]

const config = createConfig(
    getDefaultConfig({
        appName: "Todo DApp",
        walletConnectProjectId: process.env.NEXT_PUBLIC_WALLETCONNECT_PROJECT_ID!,
        chains: [chains[0]],
    }),
);

const queryClient = new QueryClient()

export function Providers({ children }: { children: React.ReactNode }) {
    return (
        <WagmiProvider config={config}>
            <QueryClientProvider client={queryClient}>
                <ConnectKitProvider>
                    {children}
                </ConnectKitProvider>
            </QueryClientProvider>
        </WagmiProvider>
    )
}