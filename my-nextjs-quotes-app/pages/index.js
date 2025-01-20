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
    "Maafkan dirimu atas kesalahan di masa lalu. Belajarlah darinya dan terus maju.",
    "Kamu mampu melewati ini. Ingatlah seberapa jauh kamu telah melangkah.",
    "Jangan bandingkan dirimu dengan orang lain ya Diri. Kamu unik dan istimewa.",
    "Fokus pada hal-hal positif ya, Diri. Itu pasti akan memberimu energi.",
    "Kamu tidak sendirian, wahai Diri. Ada banyak orang yang peduli padamu.",
    "Berikan dirimu waktu untuk pulih. Kadang tak apa-apa untuk tidak baik-baik saja.",
    "Rayakan setiap kemenanganmu. Sekecil apa pun itu.",
    "Jadilah versi terbaik dari dirimu. Setiap hari adalah kesempatan baru.",
    "Kamu berhak disayangi dan dihargai, wahai Diri. Jangan pernah lupa itu.",
    "Wahai Diri, kamu lebih dari cukup. Percayalah.",
    "Setiap hari adalah kesempatan baru untuk berkembang. Manfaatkanlah dengan baik ya, Diri.",
    "Jangan ragu untuk meminta bantuan, wahai Diri. Kamu tidak sendirian.",
    "Kamu berharga. Kamu berpotensi. Kamu mampu.",
    "Jangan takut untuk mencoba, wahai Diri. Kesuksesanmu ada di ujung perjuangan.",
    "Kamu hebat. Kamu luar biasa. Kamu mampu melewati ini.",
    "Jangan biarkan masa lalu menghantuimu, wahai Diri. Fokuslah pada masa depan.",
    "Jangan menyerah pada keadaan, wahai Diri. Kamu mampu mengubahnya.",
    "Kamu pantas mendapat cinta sejati, wahai Diri. Jangan pernah meragukannya.",
    "Kamu sedang dalam perjalanan yang luar biasa. Nikmati setiap momennya.",
    "Jangan biarkan rasa takut menghalangimu, wahai Diri. Kamu lebih kuat darinya.",
    "Kamu berhak bahagia, wahai Diri",
    "Terimalah dirimu apa adanya ya, Diri. Kamu istimewa",
    "Esok kita berjuang bersama-sama lagi ya, Diri",
    "Wahai Diri, Teruslah berbuat baik kepada sesama ya.",
    "Keajaiban bisa terjadi. Tetaplah percaya dan berharap.",
    "Setiap langkah kecilmu berarti. Teruslah bergerak maju.",
    "Jangan takut untuk mencoba hal baru, Diri. Itu akan membawamu pada pertumbuhan.",
    "Kamu lebih baik dari yang kamu kira. Teruslah berproses menjadi versi terbaikmu ya, Diri.",
    "Wahai Diri, Kamu berdaya, Kamu berani, Kamu pantas, Kamu cukup, Kamu Bahagia",
    "Kamu mampu mencapai hal-hal hebat, wahai Diri. Percayalah pada potensimu.",
    "Wahai Diri, Kamu berada di tempat yang tepat pada waktu yang tepat. Semua akan baik-baik saja.",
    "Kamu disayangi dan dihargai oleh orang-orang di sekitarmu. Tenanglah, wahai Diri"
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
            <div className="footer">
                Made with <span className="love">❤️</span> by Rr
            </div>
        </div>
    );
};

export default Home;