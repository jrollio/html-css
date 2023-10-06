import { defineConfig } from 'astro/config';
import node from '@astrojs/node';

// https://astro.build/config
export default defineConfig({
    site: 'https://pointcloud.solutions'
    ,output: 'server'
    ,outDir: './public_html'
    ,adapter: node({
        mode: 'standalone'
    })
});
