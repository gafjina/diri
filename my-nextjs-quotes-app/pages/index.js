import React from 'react';
import Quote from '../components/Quote';

const quotes = [
    "The only limit to our realization of tomorrow is our doubts of today.",
    "The purpose of our lives is to be happy.",
    "Life is what happens when you're busy making other plans.",
    "Get busy living or get busy dying."
];

const Home = () => {
    return (
        <div className="container">
            {quotes.map((quote, index) => (
                <Quote key={index} text={quote} delay={index * 10} /> // Extend delay
            ))}
        </div>
    );
};

export default Home;