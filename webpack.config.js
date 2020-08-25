module.exports = {
    module: {
        rules: [{
                test: /\.sql$/i,
                loader: 'raw-loader',
            },
            {
                test: /\.sass$/,
                use: [
                    'vue-style-loader',
                    'css-loader',
                    {
                        loader: 'sass-loader',
                        // Requires sass-loader@^7.0.0
                        // Requires sass-loader@^9.0.0
                        options: {
                            // This is the path to your variables
                            additionalData: "@import '@/styles/variables.scss'"
                        },
                    },
                ],
            },
        ],
    },
};