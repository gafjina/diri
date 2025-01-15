import React from 'react';
import styles from './Quote.module.css';

const getRandomPosition = () => {
    const positions = ['10%', '20%', '30%', '70%', '80%']; // Random positions (middle and bottom)
    return positions[Math.floor(Math.random() * positions.length)];
};

const Quote = ({ text, delay }) => {
    const topPosition = getRandomPosition();
    return (
        <div className={styles.quote} style={{ animationDelay: `${delay}s`, top: topPosition }}>
            {text}
        </div>
    );
};

export default Quote;