INSERT INTO [Role] VALUES (1,'Administrator'), (2,'Manager'), (3,'Sales Staff'), (4,'Delivery Staff'), (5,'Customer')

INSERT INTO [User] VALUES 
('cuong', '1','Cuong','Nguyen Phu','0898876512','cuongnp123@gmail.com','84/5 Vo Van Ngan',0, 'active',2, 'active'),
('an', '1','An','Do Dinh','0937368003','andd1282@gmail.com','Quang Truong Thong Nhat',0, 'active', 1, 'active'),
('khoa', '1','Khoa','Le Anh','0563098372','khoalac12nam@gmail.com','Bui Vien - Sai Gon',0, 'active', 3, 'active'),
('hoang', '1','Hoang','Nguyen Minh','0487354221','hoangnv0912@gmail.com','Ben Thanh',0, 'active', 4, 'active'),
('kien', '1','Kien','Ngo Chi','032033471','kiennc666@yahoo.com.vn','Ben Nghe',0, 'active', 5, 'active'),
('huy', '1','Huy','Pham Phu','075776871','phuhuydaydoi@gmail.com','Bui Thi Xuan, District 1',0, 'active', 5, 'active'),
('cuong1', '1','Cuong','Nguyen Phu','0898876512','phucuong479@gmail.com','84/11/15 Ton That Thuyet Street, Ward 16, District 4',0, 'active', 5, 'active'),
('an1', '1','An','Do Dinh','0937368003','dodinhan1973@gmail.com','Quang Truong Thong Nhat',0, 'active', 5, 'active'),
('khoa1', '1','Khoa','Le Anh','0563098372','lekhoa2703@gmail.com','Thu Duc City, Sai Gon',0, 'active', 5, 'active'),
('hoang1', '1','Hoang','Nguyen Minh','0487354221','hoang390dbp@gmail.com','390 Dien Bien Phu Street, District 3',0, 'active', 5, 'active')

INSERT INTO [Category] VALUES 
('0.7 Carat Rings', 'https://www.lugaro.com/wp-content/uploads/2021/02/SGR1298-M_45.jpg', 'active'),
('0.36 Carat Rings', 'https://zoom.jewelryimages.net/edge/jthomasjewelers/images/edge/140-02227.jpg', 'active'),
('Engagement Rings', 'https://cdn.polisheddiamonds.co.nz/wp-content/uploads/2024/02/10170040/blog-post-image-930x620.jpg', 'active'),
('Wedding Rings', 'https://www.varoujan.com.au/wp-content/uploads/2022/05/sandy-millar-8vaQKYnawHw-unsplash-scaled.jpg', 'active'),
('Jewelry', 'https://time.com/shopping/static/cd09eba6652ee627f5e53b645dbd36fa/ca7ff/best-online-jewelry-stores.jpg', 'active'),
('Gemstones', 'https://d2al04l58v9bun.cloudfront.net/blog/wp-content/uploads/2022/10/01161406/Gemstones-For-November-Born-1.jpg', 'active'),
('Diamonds', 'https://df2sm3urulav.cloudfront.net/tenants/gr/uploads/content/v67gqo9cteit7qld.jpg', 'active')

INSERT INTO [Collection] VALUES 
('EST. 2020','https://www.uniqlo.com/catalog-2021ss/vn/img/hero_sp.jpg','New additions', 'active'),
('FA FOREVER','https://www.uniqlo.com/jp/ja/contents/collaboration/uniqlo-u/24ss/common/imgs/lookbookItems/lookbook-2.jpg','Another new additions', 'active'),
('SUMMER SPLASH','https://www.my-jewellery.com/media/wysiwyg/banner-mobiel_3_1__2.jpg','Summer collection 2024', 'active'),
('WINTER WONDERS','https://www.2luxury2.com/wp-content/uploads/Boucheron-Hiver-Imperial.jpg','Winter collection 2024', 'active'),
('SPRING BLOSSOM','https://queensjewels.in/cdn/shop/articles/11.png','Spring collection 2024', 'active'),
('AUTUMN ELEGANCE','https://cdn.shopify.com/s/files/1/0021/6592/files/double-tulip-pendant-rose-gold-necklace.jpg','Autumn collection 2024', 'active'),
('CASUAL CLASSICS','https://cache.net-a-porter.com/content/images/story-head-content-24thOctober2022-1666086890596.jpeg/w1900_q65.jpeg','Everyday casual wear', 'active'),
('FORMAL FINESSE','https://i.pinimg.com/originals/16/c8/c8/16c8c8380fab7820240cc2892105c7fc.jpg','Formal attire', 'active'),
('SPORTY SPIRIT','https://abelstedt.com/wp-content/uploads/2022/06/abelstedt-a-tennis.jpg','Sportswear collection', 'active'),
('NIGHT LUXURY','https://www.thejewelleryeditor.com/media/images_thumbnails/filer_public_thumbnails/old/52643/Chanel-Cosmique-jewellery.jpg__1536x0_q75_crop-scale_subsampling-2_upscale-false.jpg','Nightwear and lingerie', 'active')

INSERT INTO [Voucher] VALUES
('GRAND OPENING SALE', 'https://bluenile-blog.r2net.com/wp-content/uploads/Ring-Spacing-Hero.jpg', '2024-10-06', 'Khoa Le Anh',  'SALE MO CUA HANG FUJ, SAN SALE KHUYEN MAI 20% VAO TUAN DAU TIEN, BA CON OI MAI DO MAI DO!!!! THOI LUONG CO HAN!!!', '2BA', 20, 'active'),
('SUMMER FESTIVAL', 'https://t3.ftcdn.net/jpg/04/88/69/66/360_F_488696618_kWOXm54yPma0njDqtKuKRPDs1YmZiaUx.jpg', '2024-07-01', 'Cuong Nguyen Phu', 'SUMMER FESTIVAL SALE, 15% OFF ON ALL ITEMS! LIMITED TIME OFFER!!!', '3BF', 15, 'active'),
('WINTER HOLIDAY SALE', 'https://vancouver.housing.ubc.ca/wp-content/uploads/2020/12/Winter-Break-2020-Header-1200x675-1.jpg', '2024-06-02', 'Hoang Nguyen Minh', 'WINTER HOLIDAY SALE, 20% OFF ON SELECTED ITEMS! GRAB YOUR DEALS NOW!!!', '4CD', 20, 'active'),
('SPRING BLOOM', 'https://www.telegraph.co.uk/content/dam/gardening/2024/03/15/TELEMMGLPICT000370560604_17105173385660_trans_NvBQzQNjv4BqpVlberWd9EgFPZtcLiMQf_4Xpit_DMGvdp2n7FDd82k.jpeg', '2024-03-20', 'An Do Dinh', 'SPRING BLOOM SALE, 10% OFF ON ALL SPRING COLLECTION! HURRY UP!!!', '5EF', 10, 'active'),
('AUTUMN HARVEST', 'https://scotchwhisky.com/images/media/6bc3ad4d1586e0c6e7231d816275b7cd.jpg', '2024-07-05', 'Cuong Nguyen Phu', 'AUTUMN HARVEST BIG SALE, 18% OFF ON ALL SPRING COLLECTION! HURRY UP!!!', '5EF', 18, 'active'),
('FALL FASHION FIESTA', 'https://glamadelaide.com.au/wp-content/uploads/2023/10/Gerard-McCabe-Pink-DIamond-event--450x270.jpg', '2024-09-15', 'Hoang Nguyen Minh', 'FALL FASHION FIESTA! Get 20% off on all new arrivals. Use code FALL20 at checkout. Valid until October 15, 2024.', '5EF', 20, 'active'),
('HOLIDAY SPARKLE SALE', 'https://luganodiamonds.com/content/media/2022/04/6TPanApG_Kzd/Tali_Emerald_2560x1280.1680539444.jpeg', '2024-12-01', 'An Do Dinh', 'HOLIDAY SPARKLE SALE! Enjoy 30% off on jewelry collections. Use code SPARKLE30. Ends December 25, 2024.', '6GH', 30, 'active'),
('BACK-TO-SCHOOL BONANZA', 'https://ecdn.teacherspayteachers.com/thumbitem/Back-to-School-Ring-Pop-Tag-2762721-1500134427/original-2762721-1.jpg', '2024-08-01', 'Khoa Le Anh', 'BACK-TO-SCHOOL BONANZA! Buy 2, get 1 free on all school supplies. Limited time offer!', '7IJ', 50, 'active');

INSERT INTO [Post] VALUES
('HELLO THERE!!','https://bluenile-blog.r2net.com/wp-content/uploads/Ring-Spacing-Hero.jpg', '2024-06-01', 'Cuong Nguyen Phu', 'One of the most flexible, useful and crucial pieces of jewelry can look simple enough. A small band that is no bigger than 2.5mm wide might not seem like an impactful piece of jewelry, but these rings are considered essential for many stacking styles.Thin rings, also known as ring spacers or spacer bands, are narrow and low-profile bands that are designed to fit perfectly in larger band stacks or sets. They are worn alongside at least two other rings. These thin rings can be some of the most important jewelry pieces when you are wearing multiple rings together.',
'Within the realm of jewelry, the significance of seemingly inconspicuous elements often surpasses their modest appearance. Such is the case with thin rings, unassuming bands measuring no more than 2.5mm in width, colloquially known as ring spacers or spacer bands. 
Despite their unpretentious nature, these accessories play a pivotal role in the practice of stacking rings, contributing significantly to the 
refinement and coherence of layered compositions. Thin rings are meticulously designed to seamlessly integrate into larger stacks, facilitating the creation of intricate arrangements. Their slender profile enables them to occupy the interstices between more substantial rings without compromising the overall aesthetic balance. Thus, they serve as discreet dividers, ensuring each constituent ring maintains its distinct presence while harmonizing with neighboring elements. This adaptability renders thin rings indispensable tools in the pursuit of achieving a refined and harmonious stacked ring ensemble. Moreover, the utility of thin rings extends beyond their functional role, as they offer a canvas for creative expression and individualization. Available in an array of materials, including traditional gold and silver alloys as well as contemporary alternatives like rose gold and oxidized sterling silver, they cater to diverse stylistic preferences. Additionally, their design variability, ranging from minimalist bands to embellished iterations featuring gemstones or intricate patterns, affords ample scope for personalization and experimentation.
In essence, thin rings epitomize enduring elegance and versatility in the realm of jewelry. Their timeless appeal transcends transient trends, making them indispensable additions to any discerning repertoire of reporter. Whether adorning a casual ensemble or accentuating formal attire, thin rings exude understated sophistication, elevating the aesthetic sensibilities of wearer. Thus, their inclusion in ring stacking endeavors elevates the overall aesthetic, imparting a touch of refinement and finesse to every composition.', 'active'),

('The Timeless Allure of Sapphire Rings','https://s3-ap-southeast-2.amazonaws.com/assets1.brilliyond.com.au/images/premium-sapphire-engagement-ring.png', '2024-06-02', 'An Do Dinh', 'Sapphire rings have long captivated jewelry enthusiasts with their mesmerizing beauty and rich symbolism. These exquisite pieces of jewelry are not merely accessories but timeless heirlooms that embody elegance and sophistication. From ancient royalty to modern fashion icons, sapphire rings continue to enchant with their deep blue hues and exceptional clarity. Whether set in platinum, white gold, or classic yellow gold, sapphire rings evoke a sense of luxury and refinement that transcends trends and generations.',
'Sapphire rings hold a storied legacy in the world of fine jewelry, captivating admirers with their timeless allure and profound symbolism. Renowned for their mesmerizing shades of blue, ranging from velvety midnight hues to vibrant cobalt tones, sapphires have adorned the fingers of royalty and aristocracy throughout history. Beyond their aesthetic appeal, these precious gemstones carry deep cultural significance, symbolizing loyalty, wisdom, and divine favor in many cultures. 
The enduring popularity of sapphire rings is rooted in their exceptional durability and brilliance, making them ideal for everyday wear as well as special occasions. Whether showcased in a minimalist solitaire setting or embellished with intricate diamond accents, sapphire rings exude a sense of understated luxury and sophistication. 
Their versatility allows them to complement a wide range of personal styles, from classic elegance to contemporary chic. Whether chosen as an engagement ring, anniversary gift, or statement piece, a sapphire ring promises to be a cherished treasure that transcends fleeting fashion trends. 
Furthermore, the rarity and natural beauty of sapphires ensure that each ring is as unique as its wearer, creating a bond that resonates through generations. As symbols of enduring love and timeless elegance, sapphire rings continue to enchant and inspire, embodying the essence of luxury and sophistication.', 'active'),

('The Art of Customizing Engagement Rings','https://d3kinlcl20pxwz.cloudfront.net/wpblog/creating-your-forever-the-art-of-customizing-your-dream-wedding-ring-featured-image.webp', '2024-06-03', 'Khoa Le Anh', 'Designing a custom engagement ring is a deeply personal journey that allows couples to create a one-of-a-kind symbol of their love and commitment. From selecting the perfect diamond or gemstone to choosing a unique setting that reflects their style, every detail of a custom engagement ring speaks volumes about the relationship it represents. With the guidance of skilled jewelers and access to a myriad of design options, couples can transform their vision into a breathtaking reality that will be cherished for a lifetime.',
'Crafting a custom engagement ring is a journey imbued with emotion and significance, offering couples the opportunity to create a timeless symbol of their love and commitment. At the heart of this process lies the art of personalization, where every elementfrom the choice of gemstone to the intricacies of the settingreflects the unique bond between two individuals. 
The journey begins with the selection of a centerpiece gemstone, such as a brilliant diamond or vibrant colored gemstone, chosen not only for its beauty but also for its symbolic meaning. Each gemstone carries its own allure and character, from the dazzling sparkle of a round brilliant cut diamond to the deep, velvety hue of a sapphire or emerald. 
Next comes the design phase, where couples collaborate with skilled jewelers to bring their vision to life. Whether inspired by classic elegance, modern sophistication, or avant-garde innovation, the possibilities for customization are limitless. From intricate filigree detailing to sleek, contemporary settings, every aspect of the ring is tailored to reflect the couples personal style and aesthetic preferences. 
Throughout the customization process, expert craftsmen and jewelers lend their expertise to ensure that every detail is executed with precision and artistry. Each ring is meticulously crafted to embody the unique essence of the couples love story, resulting in a piece of jewelry that is as meaningful as it is magnificent. 
Beyond its aesthetic beauty, a custom engagement ring serves as a tangible symbol of commitment and devotion, capturing the essence of a couples journey together. It is a testament to the enduring bond they share and a reflection of their shared dreams and aspirations. 
Ultimately, the art of customizing engagement rings transcends mere jewelry-making; it is a celebration of love, creativity, and the profound connection between two souls. With each bespoke creation, couples embark on a transformative experience that culminates in a cherished heirlooma symbol of their love story that will be treasured for generations to come.', 'active'),

('Exploring the Fascinating History of Wedding Bands','https://cdn0.hitched.co.uk/article/1906/3_2/1280/jpg/146091-unsplash-matheus-ferrero-wedding-ring-finger.jpeg', '2024-06-04', 'Hoang Nguyen Minh', 'Wedding bands have a rich and diverse history that spans centuries and cultures. From ancient Egypt to modern-day ceremonies, these symbolic rings have evolved in meaning and design. Initially worn as a sign of commitment and fidelity, wedding bands have become timeless symbols of love and partnership. Today, they come in various metals and styles, each carrying its own significance and cultural heritage. Whether simple and classic or adorned with intricate engravings, wedding bands continue to hold a special place in wedding traditions around the world.',
'The history of wedding bands is a tapestry woven with threads of tradition, symbolism, and cultural significance. Dating back to ancient times, these rings were originally crafted from natural materials such as reeds, hemp, or bone, symbolizing eternal love and fidelity. 
In ancient Egypt, wedding bands were worn on the left ring finger, believed to be connected directly to the heart by the vena amorisa vein that was thought to run from this finger to the heart. This symbolic gesture underscored the enduring bond between spouses and their commitment to one another. 
As civilizations advanced, so too did the craftsmanship and symbolism of wedding bands. In medieval Europe, rings were often engraved with intricate patterns or inscriptions, serving as personal talismans of love and protection. 
During the Renaissance, wedding bands became more elaborate, incorporating precious gemstones and ornate filigree work to signify wealth and social status. 
In the modern era, wedding bands have evolved to reflect individual tastes and cultural traditions. While traditional gold bands remain popular, couples now have a myriad of options to choose from, including platinum, titanium, and even unconventional materials like wood or ceramic. 
Each metal and design carries its own symbolism, whether its the timeless elegance of a plain gold band or the contemporary allure of a diamond-studded ring. 
Despite these variations, the underlying meaning of wedding bands remains unchangedthey are tangible symbols of love, commitment, and unity. 
Today, wedding bands continue to play a central role in wedding ceremonies around the world, symbolizing the eternal bond between spouses and the promises they make to one another. 
Whether passed down through generations or chosen with careful consideration, wedding bands embody the enduring legacy of lovea testament to the timeless tradition of marriage and the profound connection shared between partners.', 'active'),

('Diamonds: Beyond Brilliance','https://i.ytimg.com/vi/dx9dSwW7I9g/maxresdefault.jpg', '2024-06-05', 'Cuong Nguyen Phu', 'Diamonds have long been revered for their brilliance and beauty, but their allure extends far beyond their dazzling sparkle. These precious gemstones symbolize love, strength, and endurance, making them the ultimate expression of commitment and celebration. Whether adorning an engagement ring, necklace, or bracelet, diamonds captivate with their timeless elegance and unparalleled fire. From their formation deep within the earth to their journey to adorn the most exquisite jewelry pieces, diamonds continue to fascinate and inspire generations with their enduring allure.',
'Diamonds have fascinated humanity for centuries, revered not only for their unparalleled brilliance but also for their enduring symbolism and rarity. Formed billions of years ago under intense pressure and heat deep within the earths mantle, diamonds emerge as one of natures most extraordinary creations. 
Beyond their geological origins, diamonds hold profound cultural significance, symbolizing love, purity, and strength across diverse civilizations. Ancient Greeks believed that diamonds were splinters of stars fallen to earth, while Hindus considered them to be tears of gods. In medieval Europe, diamonds were regarded as talismans of courage and invincibility, worn by knights into battle as symbols of protection and valor. 
Today, diamonds continue to captivate with their timeless allure and unmatched beauty. Their exceptional hardness and brilliance make them the ideal choice for engagement rings, wedding bands, and other meaningful jewelry pieces that commemorate lifes most precious moments. 
From classic solitaire engagement rings to elaborate diamond necklaces and bracelets, diamonds offer endless possibilities for expression and personalization. Each diamond is as unique as its wearer, with characteristics such as cut, color, clarity, and carat weight determining its individual beauty and value. 
While traditionally associated with clear, colorless stones, diamonds also come in a spectrum of vibrant hues, including rare pink, blue, and yellow diamonds coveted for their exquisite rarity. 
Beyond their aesthetic appeal, diamonds serve as enduring symbols of love, commitment, and celebration. Whether passed down through generations as family heirlooms or newly acquired as tokens of affection, diamonds continue to inspire and enchant with their timeless elegance and emotional resonance. 
As the ultimate expression of enduring love and celebration, diamonds transcend cultural boundaries and resonate universally as symbols of hope, strength, and everlasting beauty. Their journey from the depths of the earth to the hearts of those who wear them is a testament to the enduring allure and enduring legacy of these extraordinary gemstones.', 'active'),

('Emeralds: The Jewel of Kings','https://viirjewelers.com/wp-content/uploads/2020/02/emerald-birthstone-image.jpg', '2024-06-06', 'An Do Dinh', 'Emeralds have been cherished throughout history for their lush green hues and exceptional beauty. Known as the jewel of kings, emeralds symbolize prosperity, rebirth, and eternal youth. From ancient civilizations to modern royalty, emeralds have adorned crowns, jewelry, and ceremonial regalia, embodying power and prestige. Whether set in intricate designs or showcased as stunning solitaires, emeralds continue to captivate with their natural allure and timeless elegance, making them a coveted gemstone for collectors and connoisseurs alike.',
'Emeralds have long held a coveted place in the realm of fine jewelry, admired for their captivating beauty and profound symbolism. Revered as the jewel of kings, emeralds are prized for their rich green hues, which range from vibrant grassy tones to deep velvety shades. 
Throughout history, emeralds have been associated with wealth, prosperity, and eternal youth, making them a symbol of power and prestige among rulers and nobility. 
In ancient civilizations such as Egypt and Rome, emeralds were believed to possess mystical properties and were often buried with their owners as symbols of eternal life and rebirth. 
During the Spanish conquest of the Americas, emeralds from Colombias legendary Muzo mines captivated European royalty, becoming treasured additions to crown jewels and ceremonial regalia. 
Today, emeralds continue to captivate with their natural allure and timeless elegance, adorning exquisite jewelry pieces that range from elaborate tiaras to delicate necklaces and earrings. 
Their vibrant green color is enhanced by expertly crafted settings that highlight their brilliance and clarity, from classic solitaire designs to intricate pavé settings adorned with diamonds and other precious gemstones. 
Beyond their aesthetic appeal, emeralds are prized for their rarity and durability, making them a valuable investment for collectors and connoisseurs of fine jewelry. 
Whether chosen as a symbol of love and commitment or as a treasured family heirloom, emeralds evoke a sense of sophistication and refinement that transcends time and trends. 
As symbols of prosperity and rebirth, emeralds continue to enchant and inspire, embodying the enduring allure of natures most captivating gemstones.', 'active'),

('The Art of Crafting Antique Jewelry','https://www.sadieseasongoods.com/wp-content/uploads/2023/09/vintage-jewelry-at-an-antique-store.jpg', '2024-06-07', 'Khoa Le Anh', 'Antique jewelry represents a timeless blend of artistry, history, and craftsmanship. Each piece tells a unique story, reflecting the aesthetics and cultural values of its era. From intricate Victorian filigree to bold Art Deco designs, antique jewelry showcases a diverse range of styles and techniques. Crafted using traditional methods and precious materials, these heirloom pieces have stood the test of time, captivating collectors and enthusiasts with their beauty and historical significance. Whether passed down through generations or acquired as prized possessions, antique jewelry continues to evoke admiration and fascination for its enduring elegance and artistic merit.',
'Antique jewelry is a testament to the artistry, craftsmanship, and cultural values of bygone eras, offering a glimpse into history through its exquisite designs and meticulous craftsmanship. 
From the ornate filigree of the Victorian era to the geometric motifs of Art Deco, each piece of antique jewelry tells a compelling story, reflecting the artistic trends and societal values of its time. 
Crafted by skilled artisans using traditional techniques and precious materials such as gold, silver, platinum, and gemstones, antique jewelry embodies a level of craftsmanship and attention to detail that is rarely seen in modern mass-produced jewelry. 
These heirloom pieces have survived decades or even centuries, retaining their beauty and allure while acquiring a unique patina that enhances their charm and character. 
Whether worn as a symbol of status and wealth or cherished as sentimental keepsakes passed down through generations, antique jewelry continues to captivate collectors and enthusiasts alike with its historical significance and enduring elegance. 
Each piece is a tangible link to the past, offering insights into the fashion trends, cultural beliefs, and technological innovations of the time in which it was created. 
Beyond their aesthetic appeal, antique jewelry holds emotional value as treasured heirlooms that connect families across generations. 
Whether acquired through antique dealers, auctions, or passed down as family heirlooms, these exquisite pieces continue to inspire admiration and fascination for their craftsmanship, beauty, and historical significance.', 'active'),

('Pearls: Timeless Elegance from Sea to Shore','https://www.paspaley.com/media/wysiwyg/JAN24/Discover_Australian_Pearls___Paspaley_South_Sea_Pearls.png', '2024-06-08', 'Hoang Nguyen Minh', 'Pearls have enchanted civilizations for centuries with their luminescent beauty and timeless elegance. Born from the depths of the ocean, these natural treasures symbolize purity, wisdom, and femininity. From ancient legends to modern fashion icons, pearls have adorned crowns, necklaces, and earrings, transcending trends and cultures. Whether freshwater or saltwater, natural or cultured, pearls captivate with their iridescent luster and delicate hues. Their versatility allows them to complement both casual attire and formal ensembles, making them a staple in every jewelry collection and a cherished symbol of grace and sophistication.',
'Pearls have captivated humanity for millennia with their luminescent beauty, symbolizing purity, wisdom, and femininity across diverse cultures and civilizations. Born from the depths of the ocean, pearls are unique among gemstones, created by living organisms rather than geological processes. 
Their iridescent luster and delicate hues evoke a sense of elegance and sophistication, making them prized additions to jewelry collections throughout history. 
In ancient Rome, pearls were considered the ultimate symbol of wealth and status, worn by emperors and aristocrats as symbols of power and prestige. 
In medieval Europe, pearls were believed to possess magical properties, offering protection against evil spirits and ensuring marital happiness. 
During the Renaissance, pearls adorned the elaborate costumes of royalty and nobility, reflecting their timeless allure and enduring beauty. 
Today, pearls continue to enchant with their timeless elegance and versatility, adorning everything from classic strands and earrings to modern interpretations in contemporary jewelry designs. 
Whether freshwater or saltwater, natural or cultured, pearls are celebrated for their unique qualities and natural beauty. 
Their subtle hues of white, pink, and black complement a wide range of skin tones and attire, making them a favorite choice for both casual and formal occasions. 
As symbols of grace and sophistication, pearls transcend trends and generations, embodying the enduring allure of natures most luminous treasures.', 'active'),

('The Evolution of Wedding Bands of Men','https://www.shanore.com/wp-content/uploads/2022/05/The-History-of-Mens-Wedding-Rings.jpeg', '2024-06-09', 'Cuong Nguyen Phu', 'Mens wedding bands have evolved significantly over the centuries, reflecting changes in fashion, culture, and gender norms. From simple metal bands worn for their symbolic value to contemporary designs that incorporate diamonds and alternative metals, mens wedding bands have become increasingly diverse and personalized. Modern grooms have a wide range of options to choose from, including traditional gold and platinum bands as well as innovative materials like tungsten and titanium. Each ring carries its own meaning and significance, serving as a tangible symbol of love and commitment that resonates with todays couples.',
'Mens wedding bands have undergone a transformative evolution throughout history, reflecting shifting cultural norms, fashion trends, and societal expectations. 
In ancient civilizations such as Egypt and Greece, men wore simple bands made of natural materials such as hemp or reeds, symbolizing the eternal bond of marriage. 
During the Middle Ages, mens wedding bands became more elaborate, often featuring intricate engravings or religious symbols to signify fidelity and devotion. 
In the 20th century, mens wedding bands experienced a resurgence in popularity, with traditional gold and platinum bands becoming the norm among Western couples. 
Today, mens wedding bands encompass a wide range of styles and materials, catering to diverse tastes and preferences. 
From classic designs that emphasize simplicity and elegance to modern interpretations that incorporate diamonds, alternative metals, and personalized engravings, mens wedding bands offer limitless possibilities for self-expression and individuality. 
Materials such as tungsten, titanium, and cobalt chrome have gained popularity for their durability and contemporary aesthetic, appealing to modern grooms seeking a ring that reflects their personal style and lifestyle. 
Beyond their aesthetic appeal, mens wedding bands serve as meaningful symbols of love, commitment, and partnership, symbolizing the shared journey of marriage and the promises made between spouses. 
Whether chosen for their timeless elegance, sentimental value, or modern sophistication, mens wedding bands continue to evolve as enduring symbols of devotion and unity in an ever-changing world.', 'active'),

('The Enchantment of Vintage Engagement Rings','https://assets.friendlydiamonds.com/fdl/blogs/antique-style-engagement-rings/revamped/img.webp', '2024-06-10', 'An Do Dinh', 'Vintage engagement rings exude timeless charm and romantic allure, capturing the essence of bygone eras with their intricate designs and heirloom quality. From the Art Deco glamour of the 1920s to the delicate filigree of the Victorian era, each vintage ring tells a unique story steeped in history and craftsmanship. These one-of-a-kind treasures are often adorned with vibrant gemstones and detailed engravings, reflecting the elegance and sophistication of their time. Whether passed down through generations or discovered as a cherished find, vintage engagement rings evoke a sense of nostalgia and admiration for their beauty and timeless appeal.',
'Vintage engagement rings are prized for their exquisite craftsmanship, historical significance, and timeless beauty, making them cherished heirlooms that transcend generations. 
From the ornate filigree of the Victorian era to the geometric motifs of Art Deco, each vintage engagement ring tells a unique story of craftsmanship and design. 
These one-of-a-kind treasures are often adorned with vibrant gemstones such as diamonds, sapphires, and emeralds, showcasing the artistry and attention to detail of their time. 
In addition to their aesthetic appeal, vintage engagement rings hold sentimental value as symbols of love and commitment passed down through generations. 
Whether inherited as family heirlooms or acquired as cherished finds, vintage engagement rings evoke a sense of nostalgia and admiration for their timeless elegance and historical significance. 
Their enduring beauty and craftsmanship make them sought-after pieces among collectors and enthusiasts of fine jewelry, who appreciate their unique charm and rarity. 
As symbols of love and devotion, vintage engagement rings continue to captivate with their timeless allure and romantic appeal, embodying the artistry and sentiment of bygone eras.', 'active'),

('The Allure of Designer Jewelry','https://www.caram.de/wp-content/uploads/2023/04/Caram-custom-jewelry-design_necklace-2.jpg', '2024-06-11', 'Khoa Le Anh', 'Designer jewelry embodies the pinnacle of creativity, craftsmanship, and luxury, offering discerning collectors and enthusiasts exquisite pieces that transcend trends and time. From iconic houses to emerging designers, each piece of designer jewelry is a testament to artistic vision and technical mastery. Whether showcasing rare gemstones, innovative materials, or avant-garde designs, designer jewelry celebrates individuality and innovation. These wearable works of art evoke emotions, provoke thought, and elevate personal style, making them coveted treasures for those who appreciate the intersection of fashion and art.',
'Designer jewelry represents the pinnacle of artistic expression and craftsmanship, showcasing the creative vision and technical mastery of renowned designers and luxury houses. 
Each piece is a wearable work of art, meticulously crafted to embody the designers aesthetic philosophy and showcase the finest materials and techniques. 
From iconic collections that define eras to avant-garde creations that challenge conventions, designer jewelry transcends trends and time, offering collectors and enthusiasts timeless pieces that resonate with beauty and significance. 
Whether adorned with rare gemstones, innovative materials, or intricate detailing, designer jewelry captivates with its ability to evoke emotions, provoke thought, and elevate personal style. 
These exquisite creations celebrate individuality and innovation, pushing the boundaries of traditional craftsmanship and redefining the concept of luxury. 
As symbols of creativity and self-expression, designer jewelry continues to inspire admiration and desire among discerning collectors who appreciate the intersection of fashion, art, and culture. 
Whether acquired as statement pieces or cherished investments, designer jewelry embodies the essence of luxury and craftsmanship, offering a glimpse into the world of haute couture and the enduring allure of wearable art.', 'active'),

('The Enduring Beauty of Antique Engagement Rings','https://todaysbride.ca/wp-content/uploads/2023/09/unique-and-gorgeous-vintage-engagement-ring-in-gold.jpg', '2024-06-12', 'Hoang Nguyen Minh', 'Antique engagement rings embody the timeless beauty and romantic allure of bygone eras, offering couples a unique symbol of their love and commitment. From the intricate filigree of the Edwardian era to the bold geometric designs of the Art Deco period, each antique ring tells a story of craftsmanship and sentiment. These one-of-a-kind treasures are often adorned with rare gemstones and detailed engravings, reflecting the elegance and sophistication of their time. Whether passed down through generations or discovered as a cherished find, antique engagement rings evoke a sense of nostalgia and admiration for their beauty and historical significance.',
'Antique engagement rings are prized for their exquisite craftsmanship, historical significance, and timeless beauty, making them cherished symbols of love and commitment that transcend generations. 
From the intricate filigree of the Edwardian era to the bold geometric designs of the Art Deco period, each antique engagement ring tells a unique story of craftsmanship and sentiment. 
These one-of-a-kind treasures are often adorned with rare gemstones such as diamonds, sapphires, and emeralds, showcasing the artistry and attention to detail of their time. 
In addition to their aesthetic appeal, antique engagement rings hold sentimental value as symbols of love and commitment passed down through generations. 
Whether inherited as family heirlooms or acquired as cherished finds, antique engagement rings evoke a sense of nostalgia and admiration for their timeless elegance and historical significance. 
Their enduring beauty and craftsmanship make them sought-after pieces among collectors and enthusiasts of fine jewelry, who appreciate their unique charm and rarity. 
As symbols of love and devotion, antique engagement rings continue to captivate with their timeless allure and romantic appeal, embodying the artistry and sentiment of bygone eras.', 'active');

INSERT INTO [Certificate] VALUES
('https://atticgold.com/cdn/shop/articles/ATTIC_GIA_Report.jpg','0.36 Carat Round Cut Diamond Certificate', 'active'),
('https://atticgold.com/cdn/shop/articles/ATTIC_GIA_Report.jpg','0.36 Carat Round Cut Diamond Certificate', 'active'),
('https://atticgold.com/cdn/shop/articles/ATTIC_GIA_Report.jpg','0.36 Carat Round Cut Diamond Certificate', 'active'),
('https://atticgold.com/cdn/shop/articles/ATTIC_GIA_Report.jpg','0.36 Carat Round Cut Diamond Certificate', 'active'),
('https://atticgold.com/cdn/shop/articles/ATTIC_GIA_Report.jpg','0.36 Carat Round Cut Diamond Certificate', 'active'),
('https://atticgold.com/cdn/shop/articles/ATTIC_GIA_Report.jpg','0.36 Carat Round Cut Diamond Certificate', 'active'),
('https://atticgold.com/cdn/shop/articles/ATTIC_GIA_Report.jpg','0.36 Carat Round Cut Diamond Certificate', 'active'),
('https://atticgold.com/cdn/shop/articles/ATTIC_GIA_Report.jpg','0.36 Carat Round Cut Diamond Certificate', 'active'),
('https://atticgold.com/cdn/shop/articles/ATTIC_GIA_Report.jpg','0.36 Carat Round Cut Diamond Certificate', 'active'),
('https://atticgold.com/cdn/shop/articles/ATTIC_GIA_Report.jpg','0.36 Carat Round Cut Diamond Certificate', 'active'),
('https://atticgold.com/cdn/shop/articles/ATTIC_GIA_Report.jpg','0.36 Carat Round Cut Diamond Certificate', 'active'),
('https://atticgold.com/cdn/shop/articles/ATTIC_GIA_Report.jpg','0.36 Carat Round Cut Diamond Certificate', 'active'),
('https://atticgold.com/cdn/shop/articles/ATTIC_GIA_Report.jpg','0.36 Carat Round Cut Diamond Certificate', 'active'),
('https://atticgold.com/cdn/shop/articles/ATTIC_GIA_Report.jpg','0.36 Carat Round Cut Diamond Certificate', 'active'),
('https://atticgold.com/cdn/shop/articles/ATTIC_GIA_Report.jpg','0.36 Carat Round Cut Diamond Certificate', 'active'),
('https://atticgold.com/cdn/shop/articles/ATTIC_GIA_Report.jpg','0.36 Carat Round Cut Diamond Certificate', 'active'),
('https://atticgold.com/cdn/shop/articles/ATTIC_GIA_Report.jpg','0.36 Carat Round Cut Diamond Certificate', 'active'),
('https://atticgold.com/cdn/shop/articles/ATTIC_GIA_Report.jpg','0.36 Carat Round Cut Diamond Certificate', 'active'),
('https://atticgold.com/cdn/shop/articles/ATTIC_GIA_Report.jpg','0.36 Carat Round Cut Diamond Certificate', 'active'),
('https://atticgold.com/cdn/shop/articles/ATTIC_GIA_Report.jpg','0.36 Carat Round Cut Diamond Certificate', 'active'),
('https://mygemma.com/cdn/shop/products/099157-stamp_16839a53-25af-4206-974b-8910e35d9b28_1200x.jpg','0.50 Carat Emerald Cut Diamond', 'active'),
('https://mygemma.com/cdn/shop/products/104966-stamp_1200x.jpg','0.70 ct SI1 - Round Cut Diamond', 'active'),
('https://ivyandrose.com/cdn/shop/products/original-13103certa-ce920ae2-d477-4e70-846d-9e6adef52642_8772860e-6f6c-4d27-8535-e6ef0427a153.jpg?v=1666727482','0.70 Carat Round Cut Diamond Certificate', 'active'),
('https://ivyandrose.com/cdn/shop/products/original-13103certa-ce920ae2-d477-4e70-846d-9e6adef52642_8772860e-6f6c-4d27-8535-e6ef0427a153.jpg?v=1666727482','0.70 Carat Round Cut Diamond Certificate', 'active'),
('https://ivyandrose.com/cdn/shop/products/original-13103certa-ce920ae2-d477-4e70-846d-9e6adef52642_8772860e-6f6c-4d27-8535-e6ef0427a153.jpg?v=1666727482','0.70 Carat Round Cut Diamond Certificate', 'active'),
('https://ivyandrose.com/cdn/shop/products/original-13103certa-ce920ae2-d477-4e70-846d-9e6adef52642_8772860e-6f6c-4d27-8535-e6ef0427a153.jpg?v=1666727482','0.70 Carat Round Cut Diamond Certificate', 'active'),
('https://ivyandrose.com/cdn/shop/products/original-13103certa-ce920ae2-d477-4e70-846d-9e6adef52642_8772860e-6f6c-4d27-8535-e6ef0427a153.jpg?v=1666727482','0.70 Carat Round Cut Diamond Certificate', 'active'),
('https://ivyandrose.com/cdn/shop/products/original-13103certa-ce920ae2-d477-4e70-846d-9e6adef52642_8772860e-6f6c-4d27-8535-e6ef0427a153.jpg?v=1666727482','0.70 Carat Round Cut Diamond Certificate', 'active'),
('https://ivyandrose.com/cdn/shop/products/original-13103certa-ce920ae2-d477-4e70-846d-9e6adef52642_8772860e-6f6c-4d27-8535-e6ef0427a153.jpg?v=1666727482','0.70 Carat Round Cut Diamond Certificate', 'active'),
('https://ivyandrose.com/cdn/shop/products/original-13103certa-ce920ae2-d477-4e70-846d-9e6adef52642_8772860e-6f6c-4d27-8535-e6ef0427a153.jpg?v=1666727482','0.70 Carat Round Cut Diamond Certificate', 'active'),
('https://ivyandrose.com/cdn/shop/products/original-13103certa-ce920ae2-d477-4e70-846d-9e6adef52642_8772860e-6f6c-4d27-8535-e6ef0427a153.jpg?v=1666727482','0.70 Carat Round Cut Diamond Certificate', 'active'),
('https://ivyandrose.com/cdn/shop/products/original-13103certa-ce920ae2-d477-4e70-846d-9e6adef52642_8772860e-6f6c-4d27-8535-e6ef0427a153.jpg?v=1666727482','0.70 Carat Round Cut Diamond Certificate', 'active'),
('https://ivyandrose.com/cdn/shop/products/original-13103certa-ce920ae2-d477-4e70-846d-9e6adef52642_8772860e-6f6c-4d27-8535-e6ef0427a153.jpg?v=1666727482','0.70 Carat Round Cut Diamond Certificate', 'active'),
('https://ivyandrose.com/cdn/shop/products/original-13103certa-ce920ae2-d477-4e70-846d-9e6adef52642_8772860e-6f6c-4d27-8535-e6ef0427a153.jpg?v=1666727482','0.70 Carat Round Cut Diamond Certificate', 'active'),
('https://ivyandrose.com/cdn/shop/products/original-13103certa-ce920ae2-d477-4e70-846d-9e6adef52642_8772860e-6f6c-4d27-8535-e6ef0427a153.jpg?v=1666727482','0.70 Carat Round Cut Diamond Certificate', 'active'),
('https://ivyandrose.com/cdn/shop/products/original-13103certa-ce920ae2-d477-4e70-846d-9e6adef52642_8772860e-6f6c-4d27-8535-e6ef0427a153.jpg?v=1666727482','0.70 Carat Round Cut Diamond Certificate', 'active'),
('https://ivyandrose.com/cdn/shop/products/original-13103certa-ce920ae2-d477-4e70-846d-9e6adef52642_8772860e-6f6c-4d27-8535-e6ef0427a153.jpg?v=1666727482','0.70 Carat Round Cut Diamond Certificate', 'active'),
('https://ivyandrose.com/cdn/shop/products/original-13103certa-ce920ae2-d477-4e70-846d-9e6adef52642_8772860e-6f6c-4d27-8535-e6ef0427a153.jpg?v=1666727482','0.70 Carat Round Cut Diamond Certificate', 'active'),
('https://ivyandrose.com/cdn/shop/products/original-13103certa-ce920ae2-d477-4e70-846d-9e6adef52642_8772860e-6f6c-4d27-8535-e6ef0427a153.jpg?v=1666727482','0.70 Carat Round Cut Diamond Certificate', 'active'),
('https://ivyandrose.com/cdn/shop/products/original-13103certa-ce920ae2-d477-4e70-846d-9e6adef52642_8772860e-6f6c-4d27-8535-e6ef0427a153.jpg?v=1666727482','0.70 Carat Round Cut Diamond Certificate', 'active'),
('https://ivyandrose.com/cdn/shop/products/original-13103certa-ce920ae2-d477-4e70-846d-9e6adef52642_8772860e-6f6c-4d27-8535-e6ef0427a153.jpg?v=1666727482','0.70 Carat Round Cut Diamond Certificate', 'active'),
('https://ivyandrose.com/cdn/shop/products/original-13103certa-ce920ae2-d477-4e70-846d-9e6adef52642_8772860e-6f6c-4d27-8535-e6ef0427a153.jpg?v=1666727482','0.70 Carat Round Cut Diamond Certificate', 'active')


INSERT INTO [DiamondPrice] VALUES
(4.5, 0.36, 'D','IF','ROUND BRILLIANT', 24800000, 'active'),
(4.5, 0.36, 'D','VVS1','ROUND BRILLIANT',21200000, 'active'),
(4.5, 0.36, 'D','VVS2','ROUND BRILLIANT',19800000, 'active'),
(4.5, 0.36, 'D','VS1','ROUND BRILLIANT',18500000, 'active'),
(4.5, 0.36, 'D','VS2','ROUND BRILLIANT',16000000, 'active'),
(4.5, 0.36, 'E','IF','ROUND BRILLIANT',22600000, 'active'),
(4.5, 0.36, 'E','VVS1','ROUND BRILLIANT',19200000, 'active'),
(4.5, 0.36, 'E','VVS2','ROUND BRILLIANT',17500000, 'active'),
(4.5, 0.36, 'E','VS1','ROUND BRILLIANT',16100000, 'active'),
(4.5, 0.36, 'E','VS2','ROUND BRILLIANT',14900000, 'active'),
(4.5, 0.36, 'F','IF','ROUND BRILLIANT',21900000, 'active'),
(4.5, 0.36, 'F','VVS1','ROUND BRILLIANT',18100000, 'active'),
(4.5, 0.36, 'F','VVS2','ROUND BRILLIANT',16000000, 'active'),
(4.5, 0.36, 'F','VS1','ROUND BRILLIANT',14800000, 'active'),
(4.5, 0.36, 'F','VS2','ROUND BRILLIANT',12000000, 'active'),
(4.5, 0.36, 'J','IF','ROUND BRILLIANT',14000000, 'active'),
(4.5, 0.36, 'J','VVS1','ROUND BRILLIANT',13800000, 'active'),
(4.5, 0.36, 'J','VVS2','ROUND BRILLIANT',13200000, 'active'),
(4.5, 0.36, 'J','VS1','ROUND BRILLIANT',12900000, 'active'),
(4.5, 0.36, 'J','VS2','ROUND BRILLIANT',10500000, 'active'),

(5.7, 0.7, 'D','IF','ROUND BRILLIANT',99200000, 'active'),
(5.7, 0.7, 'D','VVS1','ROUND BRILLIANT',95200000, 'active'),
(5.7, 0.7, 'D','VVS2','ROUND BRILLIANT',89900000, 'active'),
(5.7, 0.7, 'D','VS1','ROUND BRILLIANT',82900000, 'active'),
(5.7, 0.7, 'D','VS2','ROUND BRILLIANT',74800000, 'active'),
(5.7, 0.7, 'E','IF','ROUND BRILLIANT',88800000, 'active'),
(5.7, 0.7, 'E','VVS1','ROUND BRILLIANT',86300000, 'active'),
(5.7, 0.7, 'E','VVS2','ROUND BRILLIANT',84600000, 'active'),
(5.7, 0.7, 'E','VS1','ROUND BRILLIANT',78000000, 'active'),
(5.7, 0.7, 'E','VS2','ROUND BRILLIANT',73500000, 'active'),
(5.7, 0.7, 'F','IF','ROUND BRILLIANT',79200000, 'active'),
(5.7, 0.7, 'F','VVS1','ROUND BRILLIANT',76500000, 'active'),
(5.7, 0.7, 'F','VVS2','ROUND BRILLIANT',69800000, 'active'),
(5.7, 0.7, 'F','VS1','ROUND BRILLIANT',65100000, 'active'),
(5.7, 0.7, 'F','VS2','ROUND BRILLIANT',62600000, 'active'),
(5.7, 0.7, 'J','IF','ROUND BRILLIANT',56900000, 'active'),
(5.7, 0.7, 'J','VVS1','ROUND BRILLIANT',54100000, 'active'),
(5.7, 0.7, 'J','VVS2','ROUND BRILLIANT',52600000, 'active'),
(5.7, 0.7, 'J','VS1','ROUND BRILLIANT',49500000, 'active'),
(5.7, 0.7, 'J','VS2','ROUND BRILLIANT',47600000, 'active')



INSERT INTO [Diamond] VALUES
('0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','South Africa', 'active',1,1),
('0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Botswana', 'active',2,2),
('0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Russia', 'active',3,3),
('0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Canada', 'active',4,4),
('0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Australia', 'active',5,5),
('0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Namibia', 'active',6,6),
('0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Angola', 'active',7,7),
('0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Lesotho', 'active',8,8),
('0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Zimbabwe', 'active',9,9),
('0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Tanzania', 'active',10,10),
('0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Brazil', 'active',11,11),
('0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','India', 'active',12,12),
('0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Guinea', 'active',13,13),
('0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Ghana', 'active',14,14),
('0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Liberia', 'active',15,15),
('0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Guyana', 'active',16,16),
('0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Venezuela', 'active',17,17),
('0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Indonesia', 'active',18,18),
('0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Cameroon', 'active',19,19),
('0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Cameroon', 'active',20,20),

('0.7 Carat Round Cut Diamond','https://www.diamond360.co.in/imaged/B12220/still.jpg','United States', 'active',21,23),
('0.7 Carat Round Cut Diamond','https://www.diamond360.co.in/imaged/B12220/still.jpg','Mali', 'active',22,24),
('0.7 Carat Round Cut Diamond','https://www.diamond360.co.in/imaged/B12220/still.jpg','Swaziland', 'active',23,25),
('0.7 Carat Round Cut Diamond','https://www.diamond360.co.in/imaged/B12220/still.jpg','United States', 'active',24,26),
('0.7 Carat Round Cut Diamond','https://www.diamond360.co.in/imaged/B12220/still.jpg','Australia', 'active',25,27),
('0.7 Carat Round Cut Diamond','https://www.diamond360.co.in/imaged/B12220/still.jpg','Mali', 'active',26,28),
('0.7 Carat Round Cut Diamond','https://www.diamond360.co.in/imaged/B12220/still.jpg','India', 'active',27,29),
('0.7 Carat Round Cut Diamond','https://www.diamond360.co.in/imaged/B12220/still.jpg','Swaziland', 'active',28,30),
('0.7 Carat Round Cut Diamond','https://www.diamond360.co.in/imaged/B12220/still.jpg','United States', 'active',29,31),
('0.7 Carat Round Cut Diamond','https://www.diamond360.co.in/imaged/B12220/still.jpg','Mozambique', 'active',30,32),
('0.7 Carat Round Cut Diamond','https://www.diamond360.co.in/imaged/B12220/still.jpg','India', 'active',31,33),
('0.7 Carat Round Cut Diamond','https://www.diamond360.co.in/imaged/B12220/still.jpg','Australia', 'active',32,34),
('0.7 Carat Round Cut Diamond','https://www.diamond360.co.in/imaged/B12220/still.jpg','United States', 'active',33,35),
('0.7 Carat Round Cut Diamond','https://www.diamond360.co.in/imaged/B12220/still.jpg','Mozambique', 'active',34,36),
('0.7 Carat Round Cut Diamond','https://www.diamond360.co.in/imaged/B12220/still.jpg','Mali', 'active',35,37),
('0.7 Carat Round Cut Diamond','https://www.diamond360.co.in/imaged/B12220/still.jpg','Swaziland', 'active',36,38),
('0.7 Carat Round Cut Diamond','https://www.diamond360.co.in/imaged/B12220/still.jpg','Mozambique', 'active',37,39),
('0.7 Carat Round Cut Diamond','https://www.diamond360.co.in/imaged/B12220/still.jpg','Suriname', 'active',38,40),
('0.7 Carat Round Cut Diamond','https://www.diamond360.co.in/imaged/B12220/still.jpg','United States', 'active',39,41),
('0.7 Carat Round Cut Diamond','https://www.diamond360.co.in/imaged/B12220/still.jpg','Suriname', 'active',40,42)

INSERT INTO [RingPlacementPrice] VALUES
('Pure Platinum','Platinum','Silver',25000000, 'active'),
('12K Pink Gold','Gold','Pink',30000000, 'active'),
('18K Gold','Gold','Yellow Gold',35000000, 'active'),
('12K White Gold','Gold, Nickle','White',20000000, 'active'),
('24K Gold','Gold','Yellow Gold',40000000, 'active'),
('10K Rose Gold','Gold, Copper','Rose',18000000, 'active'),
('14K White Gold','Gold, Palladium','White',25000000, 'active'),
('Platinum 950','Platinum','Silver',30000000, 'active'),
('18K Rose Gold','Gold, Copper','Rose',35000000, 'active'),
('Palladium','Palladium','Silver',28000000, 'active'),
('Sterling Silver','Silver','Silver',15000000, 'active'),
('Tungsten Carbide','Tungsten','Black',22000000, 'active'),
('Titanium','Titanium','Gray',20000000, 'active'),
('Cobalt','Cobalt','Silver',17000000, 'active'),
('Carbon Fiber','Carbon','Black',19000000, 'active'),
('Ceramic','Ceramic','White',16000000, 'active'),
('18K Green Gold','Gold, Silver','Green',34000000, 'active'),
('Palladium 950','Palladium','White',27000000, 'active'),
('Stainless Steel','Steel','Silver',12000000, 'active'),
('8K Yellow Gold','Gold','Yellow',10000000, 'active'),
('14K Blue Gold','Gold, Iron','Blue',26000000, 'active'),
('10K Green Gold','Gold, Silver','Green',14000000, 'active'),
('Ruthenium','Ruthenium','Black',31000000, 'active'),
('Niobium','Niobium','Gray',23000000, 'active');

INSERT INTO [Ring] VALUES
( 1,'0.7ct Diamond Ring','https://i5.walmartimages.com/seo/Women-s-ring-zircon-sparkling-diamond-ring-with-beautiful-romantic-jewelry-gift-Zirconia-Decorative-Flower-Ring_7489d8b4-1869-4524-916f-e3eebe30c7af.7597fda62aebae63fa30bd620ad12cb7.jpeg',21,15000000,1,1, 'active'),
( 2,'0.7ct Diamond Solitaire Ring','https://i5.walmartimages.com/seo/Women-s-ring-zircon-sparkling-diamond-ring-with-beautiful-romantic-jewelry-gift-Zirconia-Decorative-Flower-Ring_7489d8b4-1869-4524-916f-e3eebe30c7af.7597fda62aebae63fa30bd620ad12cb7.jpeg',22,12000000,1,1, 'active'),
( 3,'0.36ct Diamond Solitaire Ring','https://www.berrysjewellers.co.uk/cdn/shop/products/1620389070-28905700.jpg',1,7000000,2,2, 'active'),
( 4,'0.36ct Diamond Solitaire Ring','https://www.berrysjewellers.co.uk/cdn/shop/products/1620389070-28905700.jpg',2,5000000,2,2, 'active'),
(5, '0.7ct Diamond Halo Ring', 'https://idjewelry.com/media/catalog/product/cache/6772f233b6ab10acdab5c36a45eb28cd/R/1/R11266.jpg', 23, 18000000, 3, 1, 'active'),
(6, '0.7ct Diamond Cluster Ring', 'https://www.jbrjeweler.com/cdn/shop/files/0-75-ct-oval-diamond-cluster-rose-gold-moissanite-engagement-ring-jbr-jeweler-3-27531093639359.jpg', 24, 16000000, 3, 1, 'active'),
(7, '0.36ct Diamond Eternity Ring', 'https://www.diamond-heaven.co.uk/media/catalog/product/cache/a5a9c7561e34cee028b5fa41ebc6bab1/d/h/dhjxe01306fetcrnd_white_1_4_1.jpg', 3, 8000000, 4, 2, 'active'),
(8, '0.36ct Diamond Solitaire Ring', 'https://tiagojewellery.co.uk/assets/images/products/md-r1-1253-lab-grown-45mm-qWNn.jpg', 4, 6000000, 4, 2, 'active'),
(9, '0.7ct Diamond Stone Ring', 'https://www.diamondmansion.com/media/catalog/product/design/tst-pav-6263/colorless/white/round/1680545769-Nava_Ring01_Front_03-13-23.jpg', 25, 20000000, 5, 1, 'active'),
(10, '0.7ct Diamond Vintage Ring', 'https://i.ebayimg.com/images/g/aUEAAOSwYrtiLMDs/s-l1600.jpg', 26, 17000000, 5, 1, 'active'),
(11, '0.36ct Diamond A-Deco Ring', 'https://i.etsystatic.com/13067351/r/il/feb418/1991033509/il_570xN.1991033509_2wbj.jpg', 5, 9000000, 6, 2, 'active'),
(12, '0.36ct Diamond Floral Ring', 'https://rongeorgejewelers.com/cdn/shop/products/2022-06-21-21-02-03-AeOKP..jpg', 6, 7000000, 6, 2, 'active'),
(13, '0.7ct Diamond Pave Ring', 'https://i.ebayimg.com/images/g/jhEAAOSweQxjf9B0/s-l1200.webp', 27, 22000000, 7, 1, 'active'),
(14, '0.7ct Diamond Sp-Sa Ring', 'https://images.gabrielny.com/assets/Wilma---14K-White-Gold-Split-Shank-Round-Diamond-Engagement-Ring~ER14058R6W44JJ-1.jpg', 28, 19000000, 7, 1, 'active');

INSERT INTO [Warranty] (warrantyName,warrantyImage, warrantyMonth, warrantyDescription, warrantyType, startDate, termsAndConditions, isDeleted)
VALUES
('Standard Ring Warranty', 'https://nhomin.com.vn/wp-content/uploads/2020/07/mau-phieu-bao-hanh-4.jpg', 12, 'Covers manufacturing defects for one year.', 'Manufacturer Warranty', '2024-06-01', 'See attached warranty document for terms and conditions.', 'active'),
('Extended Ring Warranty', 'https://thietkekhainguyen.com/wp-content/uploads/2018/03/the-bao-hanh-trang-suc.jpg', 24, 'Extends coverage to include repairs and resizing for two years.', 'Extended Warranty', '2024-06-01', 'See attached warranty document for terms and conditions.', 'active'),
('Premium Ring Warranty', 'https://inquangtrung.com/wp-content/uploads/2021/09/in-phieu-bao-hanh.png', 36, 'Comprehensive coverage including loss and theft protection for three years.', 'Limited Warranty', '2024-06-01', 'See attached warranty document for terms and conditions.', 'active'),
('Basic Diamond Warranty', 'https://images.thegioididong.com/Files/2009/03/04/4633/image-Phieu-bao-hanh-Imax.jpg', 6, 'Covers basic repairs and cleaning for six months.', 'Manufacturer Warranty', '2024-06-01', 'See attached warranty document for terms and conditions.', 'active'),
('Gold Ring Warranty', 'https://inanaz.com.vn/wp-content/uploads/2020/02/phieu-bao-hanh-dien-thoai-5.jpg', 18, 'Specific coverage for gold rings, including plating and resizing for one and a half years.', 'Manufacturer Warranty', '2024-06-01', 'See attached warranty document for terms and conditions.', 'active'),
('Platinum Ring Warranty', 'https://inanaz.com.vn/wp-content/uploads/2020/02/phieu-bao-hanh-dien-thoai-dep-1.jpg', 24, 'Tailored coverage for platinum rings, including polishing and maintenance for two years.', 'Manufacturer Warranty', '2024-06-01', 'See attached warranty document for terms and conditions.', 'active'),
('Diamond Replacement Warranty', 'https://innhanhhaiduong.vn/uploads/shops/2020_05/unnamed.jpg', 12, 'Provides one-time diamond replacement within the first year of purchase.', 'Extended Warranty', '2024-06-01', 'See attached warranty document for terms and conditions.', 'active'),
('Ring Resizing Warranty', 'https://inanaz.com.vn/wp-content/uploads/2020/02/phieu-bao-hanh-san-pham-1.jpg', 6, 'Covers free resizing of rings within the first six months of purchase.', 'Manufacturer Warranty', '2024-06-01', 'See attached warranty document for terms and conditions.', 'active'),
('Lifetime Ring Warranty', 'https://innhanhhaiduong.vn/uploads/shops/2020_05/unnamed.jpg', 120, 'Lifetime coverage for manufacturing defects and repairs.', 'Limited Warranty', '2024-06-01', 'See attached warranty document for terms and conditions.', 'active'),
('Comprehensive Jewelry Warranty', 'https://innhanhsieuviet.com/wp-content/uploads/2020/03/in-phien-bao-hanh-2-1.jpg', 36, 'Extensive coverage for all types of jewelry, including rings, necklaces, and bracelets, for three years.', 'Premium', '2024-06-01', 'See attached warranty document for terms and conditions.', 'active'),
('Standard Diamond Ring Limited Warranty', 'https://www.lajoyajewelry.com/wp-content/uploads/2022/05/LaJoya_WarrantyBanner_Desktop.jpg', 12, 'Covers manufacturing defects for one year.', 'Limited Warranty', '2024-06-05', 'Covers manufacturing defects for one year. Excludes damage from misuse or accidents. See attached warranty document for full terms.', 'active'),
('Extended Diamond Ring Limited Warranty', 'https://ldnew.weebly.com/uploads/4/2/6/6/4266731/7549003.jpg', 24, 'Extends coverage to include repairs and resizing for two years.', 'Extended Warranty', '2024-06-15', 'Extends coverage to include repairs and resizing for two years. Does not cover lost or stolen items. Refer to attached terms for details.', 'active'),
('Premium Diamond Ring Limited Warranty', 'https://www.persjewel.com/media/wysiwyg/Certificate-of_Authenticity-Persjewel-Monogrammed-jewelry.jpg', 36, 'Comprehensive coverage including loss and theft protection for three years.', 'Limited Warranty', '2024-06-25', 'Comprehensive coverage including loss and theft protection for three years. Excludes intentional damage. Full terms in attached document.', 'active'),
('Basic Diamond Ring Manufacturer Warranty', 'https://i.pinimg.com/736x/e9/54/76/e95476e585572e5b9a17f045a387d001.jpg', 6, 'Covers basic repairs and cleaning for six months.', 'Manufacturer Warranty', '2024-07-01', 'Covers basic repairs and cleaning for six months. Damage from accidents not covered. Refer to warranty document for details.', 'active'),
('Gold Diamond Ring Manufacturer Warranty', 'https://cdn11.bigcommerce.com/s-0bq0gey/images/stencil/1280x1280/products/273337/761918/COA__68843.1580355511.jpg', 18, 'Specific coverage for gold rings, including plating and resizing for one and a half years.', 'Manufacturer Warranty', '2024-07-05', 'Specific coverage for gold rings, including plating and resizing for one and a half years. Exclusions may apply. See warranty document for full terms.', 'active'),
('Platinum Diamond Ring Manufacturer Warranty', 'https://m.media-amazon.com/images/I/817FhbkuYxL._AC_SX522_.jpg', 24, 'Tailored coverage for platinum rings, including polishing and maintenance for two years.', 'Manufacturer Warranty', '2024-07-10', 'Tailored coverage for platinum rings, including polishing and maintenance for two years. Refer to attached terms for exclusions.', 'active'),
('Diamond Replacement Ring Extended Warranty', 'https://m.media-amazon.com/images/I/8101noskOvS._AC_SL1500_.jpg', 12, 'Provides one-time diamond replacement within the first year of purchase.', 'Extended Warranty', '2024-06-20', 'Provides one-time diamond replacement within the first year of purchase. Conditions apply. Full terms available in attached document.', 'active'),
('Ring Resizing Diamond Manufacturer Warranty', 'https://i.ebayimg.com/images/g/HIgAAOSw7pNi4nJr/s-l1600.jpg', 6, 'Covers free resizing of rings within the first six months of purchase.', 'Manufacturer Warranty', '2024-06-30', 'Covers free resizing of rings within the first six months of purchase. Does not cover resizing due to changes in finger size. See warranty document for details.', 'active'),
('Lifetime Diamond Ring Limited Warranty', 'https://i.etsystatic.com/41672613/r/il/577a85/4868343666/il_fullxfull.4868343666_aom4.jpg', 120, 'Lifetime coverage for manufacturing defects and repairs.', 'Limited Warranty', '2024-07-08', 'Lifetime coverage for manufacturing defects and repairs. Excludes damages from misuse. Refer to attached warranty for complete terms.', 'active'),
('Comprehensive Diamond Ring Limited Warranty', 'https://m.media-amazon.com/images/I/71yqyyhZjwL._AC_UY300_.jpg', 36, 'Extensive coverage for diamond rings, including repairs and maintenance for three years.', 'Limited Warranty', '2024-06-10', 'Extensive coverage for diamond rings, including repairs and maintenance for three years. Conditions and exclusions apply. See attached warranty for details.', 'active'),
('Advanced Diamond Ring Extended Warranty', 'https://i.pinimg.com/736x/36/39/ba/3639ba95b12edbd7a0ebe805a8eac1e6.jpg', 48, 'Advanced coverage including international repairs and maintenance for four years.', 'Extended Warranty', '2024-06-12', 'Advanced coverage including international repairs and maintenance for four years. For full terms, refer to the attached warranty document.', 'active'),
('Diamond Ring Care Manufacturer Warranty', 'https://i.etsystatic.com/13133627/r/il/508785/1478324559/il_fullxfull.1478324559_mypa.jpg', 24, 'Includes annual inspections and cleaning for two years.', 'Manufacturer Warranty', '2024-07-12', 'Includes annual inspections and cleaning for two years. Additional terms in the provided warranty document.', 'active'),
('Exclusive Diamond Ring Limited Warranty', 'https://m.media-amazon.com/images/I/71wBPI0C1qL._AC_UY350_.jpg', 60, 'Exclusive coverage with personalized service for five years.', 'Limited Warranty', '2024-06-08', 'Exclusive coverage with personalized service for five years. Exclusions and limitations apply. Refer to attached warranty for full details.', 'active'),
('Ultimate Diamond Ring Limited Warranty', 'https://images-static.nykaa.com/media/catalog/product/2/1/2111b4aMKRG213SSZN_5.jpg', 36, 'Ultimate protection including accidental damage for three years.', 'Limited Warranty', '2024-07-02', 'Ultimate protection including accidental damage for three years. Full terms available in attached warranty document.', 'active'),
('Deluxe Diamond Ring Limited Warranty', 'https://www.hawaiijewelrybuyers.com/wp-content/uploads/2023/04/IMG_0008_1.jpg', 24, 'Deluxe coverage for high-value diamond rings, including theft protection for two years.', 'Limited Warranty', '2024-06-28', 'Deluxe coverage for high-value diamond rings, including theft protection for two years. See warranty document for exclusions and conditions.', 'active'),
('Supreme Diamond Ring Extended Warranty', 'https://www.jamesandsons.com/public/1.0/uploads/source/diamondringwarranty_sign24sm.jpg', 48, 'Supreme coverage with extensive repair options for four years.', 'Extended Warranty', '2024-07-05', 'Supreme coverage with extensive repair options for four years. Exclusions may apply. Refer to attached warranty for full terms.', 'active'),
('Elite Diamond Ring Extended Warranty', 'https://www.barrysjewellers.com/media/catalog/product/cache/1/image/650x/a98eba4175ffcb10d8d6048461821190/8/5/85000_app.jpg', 60, 'Elite service with comprehensive coverage for five years.', 'Extended Warranty', '2024-06-18', 'Elite service with comprehensive coverage for five years. Conditions and limitations detailed in attached warranty document.', 'active'),
('Royal Diamond Ring Limited Warranty', 'https://i.ebayimg.com/images/g/Dw0AAOSw93phPyY6/s-l1200.jpg', 72, 'Royal treatment with full coverage and personalized service for six years.', 'Limited Warranty', '2024-06-22', 'Royal treatment with full coverage and personalized service for six years. See attached warranty document for exclusions and conditions.', 'active'),
('Luxury Diamond Ring Limited Warranty', 'https://ldnew.weebly.com/uploads/4/2/6/6/4266731/7549003.jpg', 84, 'Luxury coverage with worldwide repair services for seven years.', 'Limited Warranty', '2024-07-08', 'Luxury coverage with worldwide repair services for seven years. Full terms and conditions available in attached warranty.', 'active'),
('Exquisite Diamond Ring Limited Warranty', 'https://cdn11.bigcommerce.com/s-h9bpl1lcar/product_images/uploaded_images/warranty-2.jpg', 96, 'Exquisite protection with high-value ring insurance for eight years.', 'Limited Warranty', '2024-06-15', 'Exquisite protection with high-value ring insurance for eight years. Refer to the attached warranty document for detailed terms and conditions.', 'active');
