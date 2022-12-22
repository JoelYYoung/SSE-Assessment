; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_08.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_08_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !77
  store i32 -1, i32* %data, align 4, !dbg !78
  %call = call i32 @staticReturnsTrue(), !dbg !79
  %tobool = icmp ne i32 %call, 0, !dbg !79
  br i1 %tobool, label %if.then, label %if.end35, !dbg !81

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !82, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !86, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !104, metadata !DIExpression()), !dbg !105
  store i32 -1, i32* %listenSocket, align 4, !dbg !105
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !106, metadata !DIExpression()), !dbg !107
  store i32 -1, i32* %acceptSocket, align 4, !dbg !107
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  br label %do.body, !dbg !110

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !111
  store i32 %call1, i32* %listenSocket, align 4, !dbg !113
  %0 = load i32, i32* %listenSocket, align 4, !dbg !114
  %cmp = icmp eq i32 %0, -1, !dbg !116
  br i1 %cmp, label %if.then2, label %if.end, !dbg !117

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !118

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !120
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !121
  store i16 2, i16* %sin_family, align 4, !dbg !122
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !123
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !124
  store i32 0, i32* %s_addr, align 4, !dbg !125
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !126
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !127
  store i16 %call3, i16* %sin_port, align 2, !dbg !128
  %2 = load i32, i32* %listenSocket, align 4, !dbg !129
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !131
  %call4 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !132
  %cmp5 = icmp eq i32 %call4, -1, !dbg !133
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !134

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !135

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !137
  %call8 = call i32 @listen(i32 %4, i32 5) #7, !dbg !139
  %cmp9 = icmp eq i32 %call8, -1, !dbg !140
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !141

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !142

if.end11:                                         ; preds = %if.end7
  %5 = load i32, i32* %listenSocket, align 4, !dbg !144
  %call12 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !145
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !146
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !147
  %cmp13 = icmp eq i32 %6, -1, !dbg !149
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !150

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !151

if.end15:                                         ; preds = %if.end11
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !153
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !154
  %call16 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !155
  %conv = trunc i64 %call16 to i32, !dbg !155
  store i32 %conv, i32* %recvResult, align 4, !dbg !156
  %8 = load i32, i32* %recvResult, align 4, !dbg !157
  %cmp17 = icmp eq i32 %8, -1, !dbg !159
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !160

lor.lhs.false:                                    ; preds = %if.end15
  %9 = load i32, i32* %recvResult, align 4, !dbg !161
  %cmp19 = icmp eq i32 %9, 0, !dbg !162
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !163

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !164

if.end22:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !166
  %idxprom = sext i32 %10 to i64, !dbg !167
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !167
  store i8 0, i8* %arrayidx, align 1, !dbg !168
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !169
  %call24 = call i32 @atoi(i8* %arraydecay23) #9, !dbg !170
  store i32 %call24, i32* %data, align 4, !dbg !171
  br label %do.end, !dbg !172

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !173
  %cmp25 = icmp ne i32 %11, -1, !dbg !175
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !176

if.then27:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !177
  %call28 = call i32 @close(i32 %12), !dbg !179
  br label %if.end29, !dbg !180

if.end29:                                         ; preds = %if.then27, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !181
  %cmp30 = icmp ne i32 %13, -1, !dbg !183
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !184

if.then32:                                        ; preds = %if.end29
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !185
  %call33 = call i32 @close(i32 %14), !dbg !187
  br label %if.end34, !dbg !188

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !189

if.end35:                                         ; preds = %if.end34, %entry
  %call36 = call i32 @staticReturnsTrue(), !dbg !190
  %tobool37 = icmp ne i32 %call36, 0, !dbg !190
  br i1 %tobool37, label %if.then38, label %if.end45, !dbg !192

if.then38:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !193, metadata !DIExpression()), !dbg !199
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !199
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !199
  %16 = load i32, i32* %data, align 4, !dbg !200
  %cmp39 = icmp sge i32 %16, 0, !dbg !202
  br i1 %cmp39, label %if.then41, label %if.else, !dbg !203

if.then41:                                        ; preds = %if.then38
  %17 = load i32, i32* %data, align 4, !dbg !204
  %idxprom42 = sext i32 %17 to i64, !dbg !206
  %arrayidx43 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom42, !dbg !206
  %18 = load i32, i32* %arrayidx43, align 4, !dbg !206
  call void @printIntLine(i32 %18), !dbg !207
  br label %if.end44, !dbg !208

if.else:                                          ; preds = %if.then38
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !209
  br label %if.end44

if.end44:                                         ; preds = %if.else, %if.then41
  br label %if.end45, !dbg !211

if.end45:                                         ; preds = %if.end44, %if.end35
  ret void, !dbg !212
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readnone willreturn
declare dso_local zeroext i16 @htons(i16 zeroext) #4

; Function Attrs: nounwind
declare dso_local i32 @bind(i32, %struct.sockaddr*, i32) #2

; Function Attrs: nounwind
declare dso_local i32 @listen(i32, i32) #2

declare dso_local i32 @accept(i32, %struct.sockaddr*, i32*) #5

declare dso_local i64 @recv(i32, i8*, i64, i32) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #6

declare dso_local i32 @close(i32) #5

declare dso_local void @printIntLine(i32) #5

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_08_good() #0 !dbg !213 {
entry:
  call void @goodB2G1(), !dbg !214
  call void @goodB2G2(), !dbg !215
  call void @goodG2B1(), !dbg !216
  call void @goodG2B2(), !dbg !217
  ret void, !dbg !218
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !219 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !224, metadata !DIExpression()), !dbg !225
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !226, metadata !DIExpression()), !dbg !227
  %call = call i64 @time(i64* null) #7, !dbg !228
  %conv = trunc i64 %call to i32, !dbg !229
  call void @srand(i32 %conv) #7, !dbg !230
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !231
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_08_good(), !dbg !232
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !233
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !234
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_08_bad(), !dbg !235
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !236
  ret i32 0, !dbg !237
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !238 {
entry:
  ret i32 1, !dbg !241
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !242 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !243, metadata !DIExpression()), !dbg !244
  store i32 -1, i32* %data, align 4, !dbg !245
  %call = call i32 @staticReturnsTrue(), !dbg !246
  %tobool = icmp ne i32 %call, 0, !dbg !246
  br i1 %tobool, label %if.then, label %if.end35, !dbg !248

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !249, metadata !DIExpression()), !dbg !252
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !253, metadata !DIExpression()), !dbg !254
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !255, metadata !DIExpression()), !dbg !256
  store i32 -1, i32* %listenSocket, align 4, !dbg !256
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !257, metadata !DIExpression()), !dbg !258
  store i32 -1, i32* %acceptSocket, align 4, !dbg !258
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !259, metadata !DIExpression()), !dbg !260
  br label %do.body, !dbg !261

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !262
  store i32 %call1, i32* %listenSocket, align 4, !dbg !264
  %0 = load i32, i32* %listenSocket, align 4, !dbg !265
  %cmp = icmp eq i32 %0, -1, !dbg !267
  br i1 %cmp, label %if.then2, label %if.end, !dbg !268

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !269

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !271
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !271
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !272
  store i16 2, i16* %sin_family, align 4, !dbg !273
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !274
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !275
  store i32 0, i32* %s_addr, align 4, !dbg !276
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !277
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !278
  store i16 %call3, i16* %sin_port, align 2, !dbg !279
  %2 = load i32, i32* %listenSocket, align 4, !dbg !280
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !282
  %call4 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !283
  %cmp5 = icmp eq i32 %call4, -1, !dbg !284
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !285

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !286

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !288
  %call8 = call i32 @listen(i32 %4, i32 5) #7, !dbg !290
  %cmp9 = icmp eq i32 %call8, -1, !dbg !291
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !292

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !293

if.end11:                                         ; preds = %if.end7
  %5 = load i32, i32* %listenSocket, align 4, !dbg !295
  %call12 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !296
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !297
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !298
  %cmp13 = icmp eq i32 %6, -1, !dbg !300
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !301

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !302

if.end15:                                         ; preds = %if.end11
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !304
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !305
  %call16 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !306
  %conv = trunc i64 %call16 to i32, !dbg !306
  store i32 %conv, i32* %recvResult, align 4, !dbg !307
  %8 = load i32, i32* %recvResult, align 4, !dbg !308
  %cmp17 = icmp eq i32 %8, -1, !dbg !310
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !311

lor.lhs.false:                                    ; preds = %if.end15
  %9 = load i32, i32* %recvResult, align 4, !dbg !312
  %cmp19 = icmp eq i32 %9, 0, !dbg !313
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !314

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !315

if.end22:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !317
  %idxprom = sext i32 %10 to i64, !dbg !318
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !318
  store i8 0, i8* %arrayidx, align 1, !dbg !319
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !320
  %call24 = call i32 @atoi(i8* %arraydecay23) #9, !dbg !321
  store i32 %call24, i32* %data, align 4, !dbg !322
  br label %do.end, !dbg !323

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !324
  %cmp25 = icmp ne i32 %11, -1, !dbg !326
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !327

if.then27:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !328
  %call28 = call i32 @close(i32 %12), !dbg !330
  br label %if.end29, !dbg !331

if.end29:                                         ; preds = %if.then27, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !332
  %cmp30 = icmp ne i32 %13, -1, !dbg !334
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !335

if.then32:                                        ; preds = %if.end29
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !336
  %call33 = call i32 @close(i32 %14), !dbg !338
  br label %if.end34, !dbg !339

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !340

if.end35:                                         ; preds = %if.end34, %entry
  %call36 = call i32 @staticReturnsFalse(), !dbg !341
  %tobool37 = icmp ne i32 %call36, 0, !dbg !341
  br i1 %tobool37, label %if.then38, label %if.else, !dbg !343

if.then38:                                        ; preds = %if.end35
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !344
  br label %if.end48, !dbg !346

if.else:                                          ; preds = %if.end35
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !347, metadata !DIExpression()), !dbg !350
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !350
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !350
  %16 = load i32, i32* %data, align 4, !dbg !351
  %cmp39 = icmp sge i32 %16, 0, !dbg !353
  br i1 %cmp39, label %land.lhs.true, label %if.else46, !dbg !354

land.lhs.true:                                    ; preds = %if.else
  %17 = load i32, i32* %data, align 4, !dbg !355
  %cmp41 = icmp slt i32 %17, 10, !dbg !356
  br i1 %cmp41, label %if.then43, label %if.else46, !dbg !357

if.then43:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !358
  %idxprom44 = sext i32 %18 to i64, !dbg !360
  %arrayidx45 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom44, !dbg !360
  %19 = load i32, i32* %arrayidx45, align 4, !dbg !360
  call void @printIntLine(i32 %19), !dbg !361
  br label %if.end47, !dbg !362

if.else46:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !363
  br label %if.end47

if.end47:                                         ; preds = %if.else46, %if.then43
  br label %if.end48

if.end48:                                         ; preds = %if.end47, %if.then38
  ret void, !dbg !365
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !366 {
entry:
  ret i32 0, !dbg !367
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !368 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !369, metadata !DIExpression()), !dbg !370
  store i32 -1, i32* %data, align 4, !dbg !371
  %call = call i32 @staticReturnsTrue(), !dbg !372
  %tobool = icmp ne i32 %call, 0, !dbg !372
  br i1 %tobool, label %if.then, label %if.end35, !dbg !374

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !375, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !379, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !381, metadata !DIExpression()), !dbg !382
  store i32 -1, i32* %listenSocket, align 4, !dbg !382
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !383, metadata !DIExpression()), !dbg !384
  store i32 -1, i32* %acceptSocket, align 4, !dbg !384
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !385, metadata !DIExpression()), !dbg !386
  br label %do.body, !dbg !387

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !388
  store i32 %call1, i32* %listenSocket, align 4, !dbg !390
  %0 = load i32, i32* %listenSocket, align 4, !dbg !391
  %cmp = icmp eq i32 %0, -1, !dbg !393
  br i1 %cmp, label %if.then2, label %if.end, !dbg !394

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !395

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !397
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !397
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !398
  store i16 2, i16* %sin_family, align 4, !dbg !399
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !400
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !401
  store i32 0, i32* %s_addr, align 4, !dbg !402
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !403
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !404
  store i16 %call3, i16* %sin_port, align 2, !dbg !405
  %2 = load i32, i32* %listenSocket, align 4, !dbg !406
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !408
  %call4 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !409
  %cmp5 = icmp eq i32 %call4, -1, !dbg !410
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !411

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !412

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !414
  %call8 = call i32 @listen(i32 %4, i32 5) #7, !dbg !416
  %cmp9 = icmp eq i32 %call8, -1, !dbg !417
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !418

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !419

if.end11:                                         ; preds = %if.end7
  %5 = load i32, i32* %listenSocket, align 4, !dbg !421
  %call12 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !422
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !423
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !424
  %cmp13 = icmp eq i32 %6, -1, !dbg !426
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !427

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !428

if.end15:                                         ; preds = %if.end11
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !430
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !431
  %call16 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !432
  %conv = trunc i64 %call16 to i32, !dbg !432
  store i32 %conv, i32* %recvResult, align 4, !dbg !433
  %8 = load i32, i32* %recvResult, align 4, !dbg !434
  %cmp17 = icmp eq i32 %8, -1, !dbg !436
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !437

lor.lhs.false:                                    ; preds = %if.end15
  %9 = load i32, i32* %recvResult, align 4, !dbg !438
  %cmp19 = icmp eq i32 %9, 0, !dbg !439
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !440

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !441

if.end22:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !443
  %idxprom = sext i32 %10 to i64, !dbg !444
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !444
  store i8 0, i8* %arrayidx, align 1, !dbg !445
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !446
  %call24 = call i32 @atoi(i8* %arraydecay23) #9, !dbg !447
  store i32 %call24, i32* %data, align 4, !dbg !448
  br label %do.end, !dbg !449

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !450
  %cmp25 = icmp ne i32 %11, -1, !dbg !452
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !453

if.then27:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !454
  %call28 = call i32 @close(i32 %12), !dbg !456
  br label %if.end29, !dbg !457

if.end29:                                         ; preds = %if.then27, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !458
  %cmp30 = icmp ne i32 %13, -1, !dbg !460
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !461

if.then32:                                        ; preds = %if.end29
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !462
  %call33 = call i32 @close(i32 %14), !dbg !464
  br label %if.end34, !dbg !465

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !466

if.end35:                                         ; preds = %if.end34, %entry
  %call36 = call i32 @staticReturnsTrue(), !dbg !467
  %tobool37 = icmp ne i32 %call36, 0, !dbg !467
  br i1 %tobool37, label %if.then38, label %if.end47, !dbg !469

if.then38:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !470, metadata !DIExpression()), !dbg !473
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !473
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !473
  %16 = load i32, i32* %data, align 4, !dbg !474
  %cmp39 = icmp sge i32 %16, 0, !dbg !476
  br i1 %cmp39, label %land.lhs.true, label %if.else, !dbg !477

land.lhs.true:                                    ; preds = %if.then38
  %17 = load i32, i32* %data, align 4, !dbg !478
  %cmp41 = icmp slt i32 %17, 10, !dbg !479
  br i1 %cmp41, label %if.then43, label %if.else, !dbg !480

if.then43:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !481
  %idxprom44 = sext i32 %18 to i64, !dbg !483
  %arrayidx45 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom44, !dbg !483
  %19 = load i32, i32* %arrayidx45, align 4, !dbg !483
  call void @printIntLine(i32 %19), !dbg !484
  br label %if.end46, !dbg !485

if.else:                                          ; preds = %land.lhs.true, %if.then38
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !486
  br label %if.end46

if.end46:                                         ; preds = %if.else, %if.then43
  br label %if.end47, !dbg !488

if.end47:                                         ; preds = %if.end46, %if.end35
  ret void, !dbg !489
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !490 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !491, metadata !DIExpression()), !dbg !492
  store i32 -1, i32* %data, align 4, !dbg !493
  %call = call i32 @staticReturnsFalse(), !dbg !494
  %tobool = icmp ne i32 %call, 0, !dbg !494
  br i1 %tobool, label %if.then, label %if.else, !dbg !496

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !497
  br label %if.end, !dbg !499

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !500
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @staticReturnsTrue(), !dbg !502
  %tobool2 = icmp ne i32 %call1, 0, !dbg !502
  br i1 %tobool2, label %if.then3, label %if.end7, !dbg !504

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !505, metadata !DIExpression()), !dbg !508
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !508
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !508
  %1 = load i32, i32* %data, align 4, !dbg !509
  %cmp = icmp sge i32 %1, 0, !dbg !511
  br i1 %cmp, label %if.then4, label %if.else5, !dbg !512

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !513
  %idxprom = sext i32 %2 to i64, !dbg !515
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !515
  %3 = load i32, i32* %arrayidx, align 4, !dbg !515
  call void @printIntLine(i32 %3), !dbg !516
  br label %if.end6, !dbg !517

if.else5:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !518
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7, !dbg !520

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !521
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !522 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !523, metadata !DIExpression()), !dbg !524
  store i32 -1, i32* %data, align 4, !dbg !525
  %call = call i32 @staticReturnsTrue(), !dbg !526
  %tobool = icmp ne i32 %call, 0, !dbg !526
  br i1 %tobool, label %if.then, label %if.end, !dbg !528

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !529
  br label %if.end, !dbg !531

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !532
  %tobool2 = icmp ne i32 %call1, 0, !dbg !532
  br i1 %tobool2, label %if.then3, label %if.end6, !dbg !534

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !535, metadata !DIExpression()), !dbg !538
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !538
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !538
  %1 = load i32, i32* %data, align 4, !dbg !539
  %cmp = icmp sge i32 %1, 0, !dbg !541
  br i1 %cmp, label %if.then4, label %if.else, !dbg !542

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !543
  %idxprom = sext i32 %2 to i64, !dbg !545
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !545
  %3 = load i32, i32* %arrayidx, align 4, !dbg !545
  call void @printIntLine(i32 %3), !dbg !546
  br label %if.end5, !dbg !547

if.else:                                          ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !548
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !550

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !551
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readnone willreturn }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!64, !65, !66, !67, !68}
!llvm.ident = !{!69}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_08.c", directory: "/root/SSE-Assessment")
!2 = !{!3, !16}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "__socket_type", file: !4, line: 24, baseType: !5, size: 32, elements: !6)
!4 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket_type.h", directory: "")
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!7, !8, !9, !10, !11, !12, !13, !14, !15}
!7 = !DIEnumerator(name: "SOCK_STREAM", value: 1)
!8 = !DIEnumerator(name: "SOCK_DGRAM", value: 2)
!9 = !DIEnumerator(name: "SOCK_RAW", value: 3)
!10 = !DIEnumerator(name: "SOCK_RDM", value: 4)
!11 = !DIEnumerator(name: "SOCK_SEQPACKET", value: 5)
!12 = !DIEnumerator(name: "SOCK_DCCP", value: 6)
!13 = !DIEnumerator(name: "SOCK_PACKET", value: 10)
!14 = !DIEnumerator(name: "SOCK_CLOEXEC", value: 524288)
!15 = !DIEnumerator(name: "SOCK_NONBLOCK", value: 2048)
!16 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !17, line: 40, baseType: !5, size: 32, elements: !18)
!17 = !DIFile(filename: "/usr/include/netinet/in.h", directory: "")
!18 = !{!19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44}
!19 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!20 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!21 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!22 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!23 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!24 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!25 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!26 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!27 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!28 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!29 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!30 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!31 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!32 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!33 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!34 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!35 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!36 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!37 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!38 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!39 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!40 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!41 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!42 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!43 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!44 = !DIEnumerator(name: "IPPROTO_MAX", value: 256)
!45 = !{!46, !51, !5}
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !48, line: 26, baseType: !49)
!48 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !50, line: 41, baseType: !5)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !53, line: 175, size: 128, elements: !54)
!53 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!54 = !{!55, !59}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !52, file: !53, line: 177, baseType: !56, size: 16)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !57, line: 28, baseType: !58)
!57 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!58 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !52, file: !53, line: 178, baseType: !60, size: 112, offset: 16)
!60 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 112, elements: !62)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !{!63}
!63 = !DISubrange(count: 14)
!64 = !{i32 7, !"Dwarf Version", i32 4}
!65 = !{i32 2, !"Debug Info Version", i32 3}
!66 = !{i32 1, !"wchar_size", i32 4}
!67 = !{i32 7, !"uwtable", i32 1}
!68 = !{i32 7, !"frame-pointer", i32 2}
!69 = !{!"clang version 13.0.0"}
!70 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_08_bad", scope: !71, file: !71, line: 57, type: !72, scopeLine: 58, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_08.c", directory: "/root/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 59, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 59, column: 9, scope: !70)
!78 = !DILocation(line: 61, column: 10, scope: !70)
!79 = !DILocation(line: 62, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !70, file: !71, line: 62, column: 8)
!81 = !DILocation(line: 62, column: 8, scope: !70)
!82 = !DILocalVariable(name: "recvResult", scope: !83, file: !71, line: 69, type: !76)
!83 = distinct !DILexicalBlock(scope: !84, file: !71, line: 64, column: 9)
!84 = distinct !DILexicalBlock(scope: !80, file: !71, line: 63, column: 5)
!85 = !DILocation(line: 69, column: 17, scope: !83)
!86 = !DILocalVariable(name: "service", scope: !83, file: !71, line: 70, type: !87)
!87 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !88)
!88 = !{!89, !90, !94, !98}
!89 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !87, file: !17, line: 239, baseType: !56, size: 16)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !87, file: !17, line: 240, baseType: !91, size: 16, offset: 16)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !93)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 39, baseType: !58)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !87, file: !17, line: 241, baseType: !95, size: 32, offset: 32)
!95 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !96)
!96 = !{!97}
!97 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !95, file: !17, line: 33, baseType: !46, size: 32)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !87, file: !17, line: 244, baseType: !99, size: 64, offset: 64)
!99 = !DICompositeType(tag: DW_TAG_array_type, baseType: !100, size: 64, elements: !101)
!100 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!101 = !{!102}
!102 = !DISubrange(count: 8)
!103 = !DILocation(line: 70, column: 32, scope: !83)
!104 = !DILocalVariable(name: "listenSocket", scope: !83, file: !71, line: 71, type: !76)
!105 = !DILocation(line: 71, column: 20, scope: !83)
!106 = !DILocalVariable(name: "acceptSocket", scope: !83, file: !71, line: 72, type: !76)
!107 = !DILocation(line: 72, column: 20, scope: !83)
!108 = !DILocalVariable(name: "inputBuffer", scope: !83, file: !71, line: 73, type: !60)
!109 = !DILocation(line: 73, column: 18, scope: !83)
!110 = !DILocation(line: 74, column: 13, scope: !83)
!111 = !DILocation(line: 84, column: 32, scope: !112)
!112 = distinct !DILexicalBlock(scope: !83, file: !71, line: 75, column: 13)
!113 = !DILocation(line: 84, column: 30, scope: !112)
!114 = !DILocation(line: 85, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !71, line: 85, column: 21)
!116 = !DILocation(line: 85, column: 34, scope: !115)
!117 = !DILocation(line: 85, column: 21, scope: !112)
!118 = !DILocation(line: 87, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !71, line: 86, column: 17)
!120 = !DILocation(line: 89, column: 17, scope: !112)
!121 = !DILocation(line: 90, column: 25, scope: !112)
!122 = !DILocation(line: 90, column: 36, scope: !112)
!123 = !DILocation(line: 91, column: 25, scope: !112)
!124 = !DILocation(line: 91, column: 34, scope: !112)
!125 = !DILocation(line: 91, column: 41, scope: !112)
!126 = !DILocation(line: 92, column: 36, scope: !112)
!127 = !DILocation(line: 92, column: 25, scope: !112)
!128 = !DILocation(line: 92, column: 34, scope: !112)
!129 = !DILocation(line: 93, column: 26, scope: !130)
!130 = distinct !DILexicalBlock(scope: !112, file: !71, line: 93, column: 21)
!131 = !DILocation(line: 93, column: 40, scope: !130)
!132 = !DILocation(line: 93, column: 21, scope: !130)
!133 = !DILocation(line: 93, column: 85, scope: !130)
!134 = !DILocation(line: 93, column: 21, scope: !112)
!135 = !DILocation(line: 95, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !71, line: 94, column: 17)
!137 = !DILocation(line: 97, column: 28, scope: !138)
!138 = distinct !DILexicalBlock(scope: !112, file: !71, line: 97, column: 21)
!139 = !DILocation(line: 97, column: 21, scope: !138)
!140 = !DILocation(line: 97, column: 58, scope: !138)
!141 = !DILocation(line: 97, column: 21, scope: !112)
!142 = !DILocation(line: 99, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !138, file: !71, line: 98, column: 17)
!144 = !DILocation(line: 101, column: 39, scope: !112)
!145 = !DILocation(line: 101, column: 32, scope: !112)
!146 = !DILocation(line: 101, column: 30, scope: !112)
!147 = !DILocation(line: 102, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !112, file: !71, line: 102, column: 21)
!149 = !DILocation(line: 102, column: 34, scope: !148)
!150 = !DILocation(line: 102, column: 21, scope: !112)
!151 = !DILocation(line: 104, column: 21, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !71, line: 103, column: 17)
!153 = !DILocation(line: 107, column: 35, scope: !112)
!154 = !DILocation(line: 107, column: 49, scope: !112)
!155 = !DILocation(line: 107, column: 30, scope: !112)
!156 = !DILocation(line: 107, column: 28, scope: !112)
!157 = !DILocation(line: 108, column: 21, scope: !158)
!158 = distinct !DILexicalBlock(scope: !112, file: !71, line: 108, column: 21)
!159 = !DILocation(line: 108, column: 32, scope: !158)
!160 = !DILocation(line: 108, column: 48, scope: !158)
!161 = !DILocation(line: 108, column: 51, scope: !158)
!162 = !DILocation(line: 108, column: 62, scope: !158)
!163 = !DILocation(line: 108, column: 21, scope: !112)
!164 = !DILocation(line: 110, column: 21, scope: !165)
!165 = distinct !DILexicalBlock(scope: !158, file: !71, line: 109, column: 17)
!166 = !DILocation(line: 113, column: 29, scope: !112)
!167 = !DILocation(line: 113, column: 17, scope: !112)
!168 = !DILocation(line: 113, column: 41, scope: !112)
!169 = !DILocation(line: 115, column: 29, scope: !112)
!170 = !DILocation(line: 115, column: 24, scope: !112)
!171 = !DILocation(line: 115, column: 22, scope: !112)
!172 = !DILocation(line: 116, column: 13, scope: !112)
!173 = !DILocation(line: 118, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !83, file: !71, line: 118, column: 17)
!175 = !DILocation(line: 118, column: 30, scope: !174)
!176 = !DILocation(line: 118, column: 17, scope: !83)
!177 = !DILocation(line: 120, column: 30, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !71, line: 119, column: 13)
!179 = !DILocation(line: 120, column: 17, scope: !178)
!180 = !DILocation(line: 121, column: 13, scope: !178)
!181 = !DILocation(line: 122, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !83, file: !71, line: 122, column: 17)
!183 = !DILocation(line: 122, column: 30, scope: !182)
!184 = !DILocation(line: 122, column: 17, scope: !83)
!185 = !DILocation(line: 124, column: 30, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !71, line: 123, column: 13)
!187 = !DILocation(line: 124, column: 17, scope: !186)
!188 = !DILocation(line: 125, column: 13, scope: !186)
!189 = !DILocation(line: 133, column: 5, scope: !84)
!190 = !DILocation(line: 134, column: 8, scope: !191)
!191 = distinct !DILexicalBlock(scope: !70, file: !71, line: 134, column: 8)
!192 = !DILocation(line: 134, column: 8, scope: !70)
!193 = !DILocalVariable(name: "buffer", scope: !194, file: !71, line: 137, type: !196)
!194 = distinct !DILexicalBlock(scope: !195, file: !71, line: 136, column: 9)
!195 = distinct !DILexicalBlock(scope: !191, file: !71, line: 135, column: 5)
!196 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !197)
!197 = !{!198}
!198 = !DISubrange(count: 10)
!199 = !DILocation(line: 137, column: 17, scope: !194)
!200 = !DILocation(line: 140, column: 17, scope: !201)
!201 = distinct !DILexicalBlock(scope: !194, file: !71, line: 140, column: 17)
!202 = !DILocation(line: 140, column: 22, scope: !201)
!203 = !DILocation(line: 140, column: 17, scope: !194)
!204 = !DILocation(line: 142, column: 37, scope: !205)
!205 = distinct !DILexicalBlock(scope: !201, file: !71, line: 141, column: 13)
!206 = !DILocation(line: 142, column: 30, scope: !205)
!207 = !DILocation(line: 142, column: 17, scope: !205)
!208 = !DILocation(line: 143, column: 13, scope: !205)
!209 = !DILocation(line: 146, column: 17, scope: !210)
!210 = distinct !DILexicalBlock(scope: !201, file: !71, line: 145, column: 13)
!211 = !DILocation(line: 149, column: 5, scope: !195)
!212 = !DILocation(line: 150, column: 1, scope: !70)
!213 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_08_good", scope: !71, file: !71, line: 416, type: !72, scopeLine: 417, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!214 = !DILocation(line: 418, column: 5, scope: !213)
!215 = !DILocation(line: 419, column: 5, scope: !213)
!216 = !DILocation(line: 420, column: 5, scope: !213)
!217 = !DILocation(line: 421, column: 5, scope: !213)
!218 = !DILocation(line: 422, column: 1, scope: !213)
!219 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 433, type: !220, scopeLine: 434, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!220 = !DISubroutineType(types: !221)
!221 = !{!76, !76, !222}
!222 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !223, size: 64)
!223 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!224 = !DILocalVariable(name: "argc", arg: 1, scope: !219, file: !71, line: 433, type: !76)
!225 = !DILocation(line: 433, column: 14, scope: !219)
!226 = !DILocalVariable(name: "argv", arg: 2, scope: !219, file: !71, line: 433, type: !222)
!227 = !DILocation(line: 433, column: 27, scope: !219)
!228 = !DILocation(line: 436, column: 22, scope: !219)
!229 = !DILocation(line: 436, column: 12, scope: !219)
!230 = !DILocation(line: 436, column: 5, scope: !219)
!231 = !DILocation(line: 438, column: 5, scope: !219)
!232 = !DILocation(line: 439, column: 5, scope: !219)
!233 = !DILocation(line: 440, column: 5, scope: !219)
!234 = !DILocation(line: 443, column: 5, scope: !219)
!235 = !DILocation(line: 444, column: 5, scope: !219)
!236 = !DILocation(line: 445, column: 5, scope: !219)
!237 = !DILocation(line: 447, column: 5, scope: !219)
!238 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !71, file: !71, line: 45, type: !239, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!239 = !DISubroutineType(types: !240)
!240 = !{!76}
!241 = !DILocation(line: 47, column: 5, scope: !238)
!242 = distinct !DISubprogram(name: "goodB2G1", scope: !71, file: !71, line: 157, type: !72, scopeLine: 158, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!243 = !DILocalVariable(name: "data", scope: !242, file: !71, line: 159, type: !76)
!244 = !DILocation(line: 159, column: 9, scope: !242)
!245 = !DILocation(line: 161, column: 10, scope: !242)
!246 = !DILocation(line: 162, column: 8, scope: !247)
!247 = distinct !DILexicalBlock(scope: !242, file: !71, line: 162, column: 8)
!248 = !DILocation(line: 162, column: 8, scope: !242)
!249 = !DILocalVariable(name: "recvResult", scope: !250, file: !71, line: 169, type: !76)
!250 = distinct !DILexicalBlock(scope: !251, file: !71, line: 164, column: 9)
!251 = distinct !DILexicalBlock(scope: !247, file: !71, line: 163, column: 5)
!252 = !DILocation(line: 169, column: 17, scope: !250)
!253 = !DILocalVariable(name: "service", scope: !250, file: !71, line: 170, type: !87)
!254 = !DILocation(line: 170, column: 32, scope: !250)
!255 = !DILocalVariable(name: "listenSocket", scope: !250, file: !71, line: 171, type: !76)
!256 = !DILocation(line: 171, column: 20, scope: !250)
!257 = !DILocalVariable(name: "acceptSocket", scope: !250, file: !71, line: 172, type: !76)
!258 = !DILocation(line: 172, column: 20, scope: !250)
!259 = !DILocalVariable(name: "inputBuffer", scope: !250, file: !71, line: 173, type: !60)
!260 = !DILocation(line: 173, column: 18, scope: !250)
!261 = !DILocation(line: 174, column: 13, scope: !250)
!262 = !DILocation(line: 184, column: 32, scope: !263)
!263 = distinct !DILexicalBlock(scope: !250, file: !71, line: 175, column: 13)
!264 = !DILocation(line: 184, column: 30, scope: !263)
!265 = !DILocation(line: 185, column: 21, scope: !266)
!266 = distinct !DILexicalBlock(scope: !263, file: !71, line: 185, column: 21)
!267 = !DILocation(line: 185, column: 34, scope: !266)
!268 = !DILocation(line: 185, column: 21, scope: !263)
!269 = !DILocation(line: 187, column: 21, scope: !270)
!270 = distinct !DILexicalBlock(scope: !266, file: !71, line: 186, column: 17)
!271 = !DILocation(line: 189, column: 17, scope: !263)
!272 = !DILocation(line: 190, column: 25, scope: !263)
!273 = !DILocation(line: 190, column: 36, scope: !263)
!274 = !DILocation(line: 191, column: 25, scope: !263)
!275 = !DILocation(line: 191, column: 34, scope: !263)
!276 = !DILocation(line: 191, column: 41, scope: !263)
!277 = !DILocation(line: 192, column: 36, scope: !263)
!278 = !DILocation(line: 192, column: 25, scope: !263)
!279 = !DILocation(line: 192, column: 34, scope: !263)
!280 = !DILocation(line: 193, column: 26, scope: !281)
!281 = distinct !DILexicalBlock(scope: !263, file: !71, line: 193, column: 21)
!282 = !DILocation(line: 193, column: 40, scope: !281)
!283 = !DILocation(line: 193, column: 21, scope: !281)
!284 = !DILocation(line: 193, column: 85, scope: !281)
!285 = !DILocation(line: 193, column: 21, scope: !263)
!286 = !DILocation(line: 195, column: 21, scope: !287)
!287 = distinct !DILexicalBlock(scope: !281, file: !71, line: 194, column: 17)
!288 = !DILocation(line: 197, column: 28, scope: !289)
!289 = distinct !DILexicalBlock(scope: !263, file: !71, line: 197, column: 21)
!290 = !DILocation(line: 197, column: 21, scope: !289)
!291 = !DILocation(line: 197, column: 58, scope: !289)
!292 = !DILocation(line: 197, column: 21, scope: !263)
!293 = !DILocation(line: 199, column: 21, scope: !294)
!294 = distinct !DILexicalBlock(scope: !289, file: !71, line: 198, column: 17)
!295 = !DILocation(line: 201, column: 39, scope: !263)
!296 = !DILocation(line: 201, column: 32, scope: !263)
!297 = !DILocation(line: 201, column: 30, scope: !263)
!298 = !DILocation(line: 202, column: 21, scope: !299)
!299 = distinct !DILexicalBlock(scope: !263, file: !71, line: 202, column: 21)
!300 = !DILocation(line: 202, column: 34, scope: !299)
!301 = !DILocation(line: 202, column: 21, scope: !263)
!302 = !DILocation(line: 204, column: 21, scope: !303)
!303 = distinct !DILexicalBlock(scope: !299, file: !71, line: 203, column: 17)
!304 = !DILocation(line: 207, column: 35, scope: !263)
!305 = !DILocation(line: 207, column: 49, scope: !263)
!306 = !DILocation(line: 207, column: 30, scope: !263)
!307 = !DILocation(line: 207, column: 28, scope: !263)
!308 = !DILocation(line: 208, column: 21, scope: !309)
!309 = distinct !DILexicalBlock(scope: !263, file: !71, line: 208, column: 21)
!310 = !DILocation(line: 208, column: 32, scope: !309)
!311 = !DILocation(line: 208, column: 48, scope: !309)
!312 = !DILocation(line: 208, column: 51, scope: !309)
!313 = !DILocation(line: 208, column: 62, scope: !309)
!314 = !DILocation(line: 208, column: 21, scope: !263)
!315 = !DILocation(line: 210, column: 21, scope: !316)
!316 = distinct !DILexicalBlock(scope: !309, file: !71, line: 209, column: 17)
!317 = !DILocation(line: 213, column: 29, scope: !263)
!318 = !DILocation(line: 213, column: 17, scope: !263)
!319 = !DILocation(line: 213, column: 41, scope: !263)
!320 = !DILocation(line: 215, column: 29, scope: !263)
!321 = !DILocation(line: 215, column: 24, scope: !263)
!322 = !DILocation(line: 215, column: 22, scope: !263)
!323 = !DILocation(line: 216, column: 13, scope: !263)
!324 = !DILocation(line: 218, column: 17, scope: !325)
!325 = distinct !DILexicalBlock(scope: !250, file: !71, line: 218, column: 17)
!326 = !DILocation(line: 218, column: 30, scope: !325)
!327 = !DILocation(line: 218, column: 17, scope: !250)
!328 = !DILocation(line: 220, column: 30, scope: !329)
!329 = distinct !DILexicalBlock(scope: !325, file: !71, line: 219, column: 13)
!330 = !DILocation(line: 220, column: 17, scope: !329)
!331 = !DILocation(line: 221, column: 13, scope: !329)
!332 = !DILocation(line: 222, column: 17, scope: !333)
!333 = distinct !DILexicalBlock(scope: !250, file: !71, line: 222, column: 17)
!334 = !DILocation(line: 222, column: 30, scope: !333)
!335 = !DILocation(line: 222, column: 17, scope: !250)
!336 = !DILocation(line: 224, column: 30, scope: !337)
!337 = distinct !DILexicalBlock(scope: !333, file: !71, line: 223, column: 13)
!338 = !DILocation(line: 224, column: 17, scope: !337)
!339 = !DILocation(line: 225, column: 13, scope: !337)
!340 = !DILocation(line: 233, column: 5, scope: !251)
!341 = !DILocation(line: 234, column: 8, scope: !342)
!342 = distinct !DILexicalBlock(scope: !242, file: !71, line: 234, column: 8)
!343 = !DILocation(line: 234, column: 8, scope: !242)
!344 = !DILocation(line: 237, column: 9, scope: !345)
!345 = distinct !DILexicalBlock(scope: !342, file: !71, line: 235, column: 5)
!346 = !DILocation(line: 238, column: 5, scope: !345)
!347 = !DILocalVariable(name: "buffer", scope: !348, file: !71, line: 242, type: !196)
!348 = distinct !DILexicalBlock(scope: !349, file: !71, line: 241, column: 9)
!349 = distinct !DILexicalBlock(scope: !342, file: !71, line: 240, column: 5)
!350 = !DILocation(line: 242, column: 17, scope: !348)
!351 = !DILocation(line: 244, column: 17, scope: !352)
!352 = distinct !DILexicalBlock(scope: !348, file: !71, line: 244, column: 17)
!353 = !DILocation(line: 244, column: 22, scope: !352)
!354 = !DILocation(line: 244, column: 27, scope: !352)
!355 = !DILocation(line: 244, column: 30, scope: !352)
!356 = !DILocation(line: 244, column: 35, scope: !352)
!357 = !DILocation(line: 244, column: 17, scope: !348)
!358 = !DILocation(line: 246, column: 37, scope: !359)
!359 = distinct !DILexicalBlock(scope: !352, file: !71, line: 245, column: 13)
!360 = !DILocation(line: 246, column: 30, scope: !359)
!361 = !DILocation(line: 246, column: 17, scope: !359)
!362 = !DILocation(line: 247, column: 13, scope: !359)
!363 = !DILocation(line: 250, column: 17, scope: !364)
!364 = distinct !DILexicalBlock(scope: !352, file: !71, line: 249, column: 13)
!365 = !DILocation(line: 254, column: 1, scope: !242)
!366 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !71, file: !71, line: 50, type: !239, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!367 = !DILocation(line: 52, column: 5, scope: !366)
!368 = distinct !DISubprogram(name: "goodB2G2", scope: !71, file: !71, line: 257, type: !72, scopeLine: 258, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!369 = !DILocalVariable(name: "data", scope: !368, file: !71, line: 259, type: !76)
!370 = !DILocation(line: 259, column: 9, scope: !368)
!371 = !DILocation(line: 261, column: 10, scope: !368)
!372 = !DILocation(line: 262, column: 8, scope: !373)
!373 = distinct !DILexicalBlock(scope: !368, file: !71, line: 262, column: 8)
!374 = !DILocation(line: 262, column: 8, scope: !368)
!375 = !DILocalVariable(name: "recvResult", scope: !376, file: !71, line: 269, type: !76)
!376 = distinct !DILexicalBlock(scope: !377, file: !71, line: 264, column: 9)
!377 = distinct !DILexicalBlock(scope: !373, file: !71, line: 263, column: 5)
!378 = !DILocation(line: 269, column: 17, scope: !376)
!379 = !DILocalVariable(name: "service", scope: !376, file: !71, line: 270, type: !87)
!380 = !DILocation(line: 270, column: 32, scope: !376)
!381 = !DILocalVariable(name: "listenSocket", scope: !376, file: !71, line: 271, type: !76)
!382 = !DILocation(line: 271, column: 20, scope: !376)
!383 = !DILocalVariable(name: "acceptSocket", scope: !376, file: !71, line: 272, type: !76)
!384 = !DILocation(line: 272, column: 20, scope: !376)
!385 = !DILocalVariable(name: "inputBuffer", scope: !376, file: !71, line: 273, type: !60)
!386 = !DILocation(line: 273, column: 18, scope: !376)
!387 = !DILocation(line: 274, column: 13, scope: !376)
!388 = !DILocation(line: 284, column: 32, scope: !389)
!389 = distinct !DILexicalBlock(scope: !376, file: !71, line: 275, column: 13)
!390 = !DILocation(line: 284, column: 30, scope: !389)
!391 = !DILocation(line: 285, column: 21, scope: !392)
!392 = distinct !DILexicalBlock(scope: !389, file: !71, line: 285, column: 21)
!393 = !DILocation(line: 285, column: 34, scope: !392)
!394 = !DILocation(line: 285, column: 21, scope: !389)
!395 = !DILocation(line: 287, column: 21, scope: !396)
!396 = distinct !DILexicalBlock(scope: !392, file: !71, line: 286, column: 17)
!397 = !DILocation(line: 289, column: 17, scope: !389)
!398 = !DILocation(line: 290, column: 25, scope: !389)
!399 = !DILocation(line: 290, column: 36, scope: !389)
!400 = !DILocation(line: 291, column: 25, scope: !389)
!401 = !DILocation(line: 291, column: 34, scope: !389)
!402 = !DILocation(line: 291, column: 41, scope: !389)
!403 = !DILocation(line: 292, column: 36, scope: !389)
!404 = !DILocation(line: 292, column: 25, scope: !389)
!405 = !DILocation(line: 292, column: 34, scope: !389)
!406 = !DILocation(line: 293, column: 26, scope: !407)
!407 = distinct !DILexicalBlock(scope: !389, file: !71, line: 293, column: 21)
!408 = !DILocation(line: 293, column: 40, scope: !407)
!409 = !DILocation(line: 293, column: 21, scope: !407)
!410 = !DILocation(line: 293, column: 85, scope: !407)
!411 = !DILocation(line: 293, column: 21, scope: !389)
!412 = !DILocation(line: 295, column: 21, scope: !413)
!413 = distinct !DILexicalBlock(scope: !407, file: !71, line: 294, column: 17)
!414 = !DILocation(line: 297, column: 28, scope: !415)
!415 = distinct !DILexicalBlock(scope: !389, file: !71, line: 297, column: 21)
!416 = !DILocation(line: 297, column: 21, scope: !415)
!417 = !DILocation(line: 297, column: 58, scope: !415)
!418 = !DILocation(line: 297, column: 21, scope: !389)
!419 = !DILocation(line: 299, column: 21, scope: !420)
!420 = distinct !DILexicalBlock(scope: !415, file: !71, line: 298, column: 17)
!421 = !DILocation(line: 301, column: 39, scope: !389)
!422 = !DILocation(line: 301, column: 32, scope: !389)
!423 = !DILocation(line: 301, column: 30, scope: !389)
!424 = !DILocation(line: 302, column: 21, scope: !425)
!425 = distinct !DILexicalBlock(scope: !389, file: !71, line: 302, column: 21)
!426 = !DILocation(line: 302, column: 34, scope: !425)
!427 = !DILocation(line: 302, column: 21, scope: !389)
!428 = !DILocation(line: 304, column: 21, scope: !429)
!429 = distinct !DILexicalBlock(scope: !425, file: !71, line: 303, column: 17)
!430 = !DILocation(line: 307, column: 35, scope: !389)
!431 = !DILocation(line: 307, column: 49, scope: !389)
!432 = !DILocation(line: 307, column: 30, scope: !389)
!433 = !DILocation(line: 307, column: 28, scope: !389)
!434 = !DILocation(line: 308, column: 21, scope: !435)
!435 = distinct !DILexicalBlock(scope: !389, file: !71, line: 308, column: 21)
!436 = !DILocation(line: 308, column: 32, scope: !435)
!437 = !DILocation(line: 308, column: 48, scope: !435)
!438 = !DILocation(line: 308, column: 51, scope: !435)
!439 = !DILocation(line: 308, column: 62, scope: !435)
!440 = !DILocation(line: 308, column: 21, scope: !389)
!441 = !DILocation(line: 310, column: 21, scope: !442)
!442 = distinct !DILexicalBlock(scope: !435, file: !71, line: 309, column: 17)
!443 = !DILocation(line: 313, column: 29, scope: !389)
!444 = !DILocation(line: 313, column: 17, scope: !389)
!445 = !DILocation(line: 313, column: 41, scope: !389)
!446 = !DILocation(line: 315, column: 29, scope: !389)
!447 = !DILocation(line: 315, column: 24, scope: !389)
!448 = !DILocation(line: 315, column: 22, scope: !389)
!449 = !DILocation(line: 316, column: 13, scope: !389)
!450 = !DILocation(line: 318, column: 17, scope: !451)
!451 = distinct !DILexicalBlock(scope: !376, file: !71, line: 318, column: 17)
!452 = !DILocation(line: 318, column: 30, scope: !451)
!453 = !DILocation(line: 318, column: 17, scope: !376)
!454 = !DILocation(line: 320, column: 30, scope: !455)
!455 = distinct !DILexicalBlock(scope: !451, file: !71, line: 319, column: 13)
!456 = !DILocation(line: 320, column: 17, scope: !455)
!457 = !DILocation(line: 321, column: 13, scope: !455)
!458 = !DILocation(line: 322, column: 17, scope: !459)
!459 = distinct !DILexicalBlock(scope: !376, file: !71, line: 322, column: 17)
!460 = !DILocation(line: 322, column: 30, scope: !459)
!461 = !DILocation(line: 322, column: 17, scope: !376)
!462 = !DILocation(line: 324, column: 30, scope: !463)
!463 = distinct !DILexicalBlock(scope: !459, file: !71, line: 323, column: 13)
!464 = !DILocation(line: 324, column: 17, scope: !463)
!465 = !DILocation(line: 325, column: 13, scope: !463)
!466 = !DILocation(line: 333, column: 5, scope: !377)
!467 = !DILocation(line: 334, column: 8, scope: !468)
!468 = distinct !DILexicalBlock(scope: !368, file: !71, line: 334, column: 8)
!469 = !DILocation(line: 334, column: 8, scope: !368)
!470 = !DILocalVariable(name: "buffer", scope: !471, file: !71, line: 337, type: !196)
!471 = distinct !DILexicalBlock(scope: !472, file: !71, line: 336, column: 9)
!472 = distinct !DILexicalBlock(scope: !468, file: !71, line: 335, column: 5)
!473 = !DILocation(line: 337, column: 17, scope: !471)
!474 = !DILocation(line: 339, column: 17, scope: !475)
!475 = distinct !DILexicalBlock(scope: !471, file: !71, line: 339, column: 17)
!476 = !DILocation(line: 339, column: 22, scope: !475)
!477 = !DILocation(line: 339, column: 27, scope: !475)
!478 = !DILocation(line: 339, column: 30, scope: !475)
!479 = !DILocation(line: 339, column: 35, scope: !475)
!480 = !DILocation(line: 339, column: 17, scope: !471)
!481 = !DILocation(line: 341, column: 37, scope: !482)
!482 = distinct !DILexicalBlock(scope: !475, file: !71, line: 340, column: 13)
!483 = !DILocation(line: 341, column: 30, scope: !482)
!484 = !DILocation(line: 341, column: 17, scope: !482)
!485 = !DILocation(line: 342, column: 13, scope: !482)
!486 = !DILocation(line: 345, column: 17, scope: !487)
!487 = distinct !DILexicalBlock(scope: !475, file: !71, line: 344, column: 13)
!488 = !DILocation(line: 348, column: 5, scope: !472)
!489 = !DILocation(line: 349, column: 1, scope: !368)
!490 = distinct !DISubprogram(name: "goodG2B1", scope: !71, file: !71, line: 352, type: !72, scopeLine: 353, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!491 = !DILocalVariable(name: "data", scope: !490, file: !71, line: 354, type: !76)
!492 = !DILocation(line: 354, column: 9, scope: !490)
!493 = !DILocation(line: 356, column: 10, scope: !490)
!494 = !DILocation(line: 357, column: 8, scope: !495)
!495 = distinct !DILexicalBlock(scope: !490, file: !71, line: 357, column: 8)
!496 = !DILocation(line: 357, column: 8, scope: !490)
!497 = !DILocation(line: 360, column: 9, scope: !498)
!498 = distinct !DILexicalBlock(scope: !495, file: !71, line: 358, column: 5)
!499 = !DILocation(line: 361, column: 5, scope: !498)
!500 = !DILocation(line: 366, column: 14, scope: !501)
!501 = distinct !DILexicalBlock(scope: !495, file: !71, line: 363, column: 5)
!502 = !DILocation(line: 368, column: 8, scope: !503)
!503 = distinct !DILexicalBlock(scope: !490, file: !71, line: 368, column: 8)
!504 = !DILocation(line: 368, column: 8, scope: !490)
!505 = !DILocalVariable(name: "buffer", scope: !506, file: !71, line: 371, type: !196)
!506 = distinct !DILexicalBlock(scope: !507, file: !71, line: 370, column: 9)
!507 = distinct !DILexicalBlock(scope: !503, file: !71, line: 369, column: 5)
!508 = !DILocation(line: 371, column: 17, scope: !506)
!509 = !DILocation(line: 374, column: 17, scope: !510)
!510 = distinct !DILexicalBlock(scope: !506, file: !71, line: 374, column: 17)
!511 = !DILocation(line: 374, column: 22, scope: !510)
!512 = !DILocation(line: 374, column: 17, scope: !506)
!513 = !DILocation(line: 376, column: 37, scope: !514)
!514 = distinct !DILexicalBlock(scope: !510, file: !71, line: 375, column: 13)
!515 = !DILocation(line: 376, column: 30, scope: !514)
!516 = !DILocation(line: 376, column: 17, scope: !514)
!517 = !DILocation(line: 377, column: 13, scope: !514)
!518 = !DILocation(line: 380, column: 17, scope: !519)
!519 = distinct !DILexicalBlock(scope: !510, file: !71, line: 379, column: 13)
!520 = !DILocation(line: 383, column: 5, scope: !507)
!521 = !DILocation(line: 384, column: 1, scope: !490)
!522 = distinct !DISubprogram(name: "goodG2B2", scope: !71, file: !71, line: 387, type: !72, scopeLine: 388, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!523 = !DILocalVariable(name: "data", scope: !522, file: !71, line: 389, type: !76)
!524 = !DILocation(line: 389, column: 9, scope: !522)
!525 = !DILocation(line: 391, column: 10, scope: !522)
!526 = !DILocation(line: 392, column: 8, scope: !527)
!527 = distinct !DILexicalBlock(scope: !522, file: !71, line: 392, column: 8)
!528 = !DILocation(line: 392, column: 8, scope: !522)
!529 = !DILocation(line: 396, column: 14, scope: !530)
!530 = distinct !DILexicalBlock(scope: !527, file: !71, line: 393, column: 5)
!531 = !DILocation(line: 397, column: 5, scope: !530)
!532 = !DILocation(line: 398, column: 8, scope: !533)
!533 = distinct !DILexicalBlock(scope: !522, file: !71, line: 398, column: 8)
!534 = !DILocation(line: 398, column: 8, scope: !522)
!535 = !DILocalVariable(name: "buffer", scope: !536, file: !71, line: 401, type: !196)
!536 = distinct !DILexicalBlock(scope: !537, file: !71, line: 400, column: 9)
!537 = distinct !DILexicalBlock(scope: !533, file: !71, line: 399, column: 5)
!538 = !DILocation(line: 401, column: 17, scope: !536)
!539 = !DILocation(line: 404, column: 17, scope: !540)
!540 = distinct !DILexicalBlock(scope: !536, file: !71, line: 404, column: 17)
!541 = !DILocation(line: 404, column: 22, scope: !540)
!542 = !DILocation(line: 404, column: 17, scope: !536)
!543 = !DILocation(line: 406, column: 37, scope: !544)
!544 = distinct !DILexicalBlock(scope: !540, file: !71, line: 405, column: 13)
!545 = !DILocation(line: 406, column: 30, scope: !544)
!546 = !DILocation(line: 406, column: 17, scope: !544)
!547 = !DILocation(line: 407, column: 13, scope: !544)
!548 = !DILocation(line: 410, column: 17, scope: !549)
!549 = distinct !DILexicalBlock(scope: !540, file: !71, line: 409, column: 13)
!550 = !DILocation(line: 413, column: 5, scope: !537)
!551 = !DILocation(line: 414, column: 1, scope: !522)
