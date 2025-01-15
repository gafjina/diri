import { useEffect, useState } from 'react';
import Quote from '../components/Quote';

const quotes = [
    "Kamu hebat. Terus melangkah ya, Diri.",
    "Jangan menyerah, wahai Diri. Kamu lebih kuat dari yang kamu kira.",
    "Istirahatlah jika lelah, wahai Diri. Kamu berhak mendapatkannya.",
    "Kamu unik. Kamu berharga. Jangan pernah meragukannya ya.",
    "Setiap langkah kecilmu berarti. Teruslah berproses.",
    "Kamu pantas bahagia, wahai Diri. Ayo Kejarlah kebahagiaanmu.",
    "Hadapi tantangan dengan berani. Kamu akan melewatinya.",
    "Tetap syukuri apa yang kamu miliki, wahai Diri. Itu akan membawamu pada kebahagiaan sejati.",
    "Maafkan dirimu atas kesalahan di masa lalu, Diri. Belajarlah darinya dan terus maju.",
    "Kamu mampu melewati ini. Ingatlah seberapa jauh kamu telah melangkah, wahai Diri.",
    "Jangan bandingkan dirimu dengan orang lain ya Diri. Kamu unik dan istimewa.",
    "Fokus pada hal-hal positif. Itu pasti akan memberimu energi.",
    "Kamu tidak sendirian, wahai Diri. Ada banyak orang yang peduli padamu.",
    "Berikan dirimu waktu untuk pulih. Kadang tak apa-apa untuk tidak baik-baik saja.",
    "Rayakan setiap kemenanganmu. Sekecil apa pun itu.",
    "Jadilah versi terbaik dari dirimu. Setiap hari adalah kesempatan baru.",
    "Kamu berhak disayangi dan dihargai, wahai Diri. Jangan pernah lupa itu.",
];

const shuffleArray = (array) => {
    for (let i = array.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
};

const Home = () => {
    const [shuffledQuotes, setShuffledQuotes] = useState(quotes);

    useEffect(() => {
        setShuffledQuotes(shuffleArray([...quotes]));
    }, []);

    return (
        <div className="container">
            {shuffledQuotes.map((quote, index) => (
                <Quote key={index} text={quote} delay={index * 10} /> // Extend delay
            ))}
            <div className="bubble">Terima Kasih, Wahai Diri</div>
            <footer className="footer">
                Made with <span className="love">❤️</span> by Rr
            </footer>
        </div>
    );
};

export default Home;