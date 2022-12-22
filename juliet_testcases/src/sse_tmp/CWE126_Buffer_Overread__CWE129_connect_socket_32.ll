; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_32.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_32_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data22 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !73, metadata !DIExpression()), !dbg !75
  store i32* %data, i32** %dataPtr1, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !76, metadata !DIExpression()), !dbg !77
  store i32* %data, i32** %dataPtr2, align 8, !dbg !77
  store i32 -1, i32* %data, align 4, !dbg !78
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !79, metadata !DIExpression()), !dbg !81
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !82
  %1 = load i32, i32* %0, align 4, !dbg !83
  store i32 %1, i32* %data1, align 4, !dbg !81
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !84, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !87, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !110, metadata !DIExpression()), !dbg !111
  store i32 -1, i32* %connectSocket, align 4, !dbg !111
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  br label %do.body, !dbg !114

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !115
  store i32 %call, i32* %connectSocket, align 4, !dbg !117
  %2 = load i32, i32* %connectSocket, align 4, !dbg !118
  %cmp = icmp eq i32 %2, -1, !dbg !120
  br i1 %cmp, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !122

if.end:                                           ; preds = %do.body
  %3 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 4 %3, i8 0, i64 16, i1 false), !dbg !124
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !125
  store i16 2, i16* %sin_family, align 4, !dbg !126
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !127
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !128
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !129
  store i32 %call2, i32* %s_addr, align 4, !dbg !130
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !131
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !132
  store i16 %call3, i16* %sin_port, align 2, !dbg !133
  %4 = load i32, i32* %connectSocket, align 4, !dbg !134
  %5 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !136
  %call4 = call i32 @connect(i32 %4, %struct.sockaddr* %5, i32 16), !dbg !137
  %cmp5 = icmp eq i32 %call4, -1, !dbg !138
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !139

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !140

if.end7:                                          ; preds = %if.end
  %6 = load i32, i32* %connectSocket, align 4, !dbg !142
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !143
  %call8 = call i64 @recv(i32 %6, i8* %arraydecay, i64 13, i32 0), !dbg !144
  %conv = trunc i64 %call8 to i32, !dbg !144
  store i32 %conv, i32* %recvResult, align 4, !dbg !145
  %7 = load i32, i32* %recvResult, align 4, !dbg !146
  %cmp9 = icmp eq i32 %7, -1, !dbg !148
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !149

lor.lhs.false:                                    ; preds = %if.end7
  %8 = load i32, i32* %recvResult, align 4, !dbg !150
  %cmp11 = icmp eq i32 %8, 0, !dbg !151
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !152

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !153

if.end14:                                         ; preds = %lor.lhs.false
  %9 = load i32, i32* %recvResult, align 4, !dbg !155
  %idxprom = sext i32 %9 to i64, !dbg !156
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !156
  store i8 0, i8* %arrayidx, align 1, !dbg !157
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !158
  %call16 = call i32 @atoi(i8* %arraydecay15) #9, !dbg !159
  store i32 %call16, i32* %data1, align 4, !dbg !160
  br label %do.end, !dbg !161

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then
  %10 = load i32, i32* %connectSocket, align 4, !dbg !162
  %cmp17 = icmp ne i32 %10, -1, !dbg !164
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !165

if.then19:                                        ; preds = %do.end
  %11 = load i32, i32* %connectSocket, align 4, !dbg !166
  %call20 = call i32 @close(i32 %11), !dbg !168
  br label %if.end21, !dbg !169

if.end21:                                         ; preds = %if.then19, %do.end
  %12 = load i32, i32* %data1, align 4, !dbg !170
  %13 = load i32*, i32** %dataPtr1, align 8, !dbg !171
  store i32 %12, i32* %13, align 4, !dbg !172
  call void @llvm.dbg.declare(metadata i32* %data22, metadata !173, metadata !DIExpression()), !dbg !175
  %14 = load i32*, i32** %dataPtr2, align 8, !dbg !176
  %15 = load i32, i32* %14, align 4, !dbg !177
  store i32 %15, i32* %data22, align 4, !dbg !175
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !178, metadata !DIExpression()), !dbg !183
  %16 = bitcast [10 x i32]* %buffer to i8*, !dbg !183
  call void @llvm.memset.p0i8.i64(i8* align 16 %16, i8 0, i64 40, i1 false), !dbg !183
  %17 = load i32, i32* %data22, align 4, !dbg !184
  %cmp23 = icmp sge i32 %17, 0, !dbg !186
  br i1 %cmp23, label %if.then25, label %if.else, !dbg !187

if.then25:                                        ; preds = %if.end21
  %18 = load i32, i32* %data22, align 4, !dbg !188
  %idxprom26 = sext i32 %18 to i64, !dbg !190
  %arrayidx27 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom26, !dbg !190
  %19 = load i32, i32* %arrayidx27, align 4, !dbg !190
  call void @printIntLine(i32 %19), !dbg !191
  br label %if.end28, !dbg !192

if.else:                                          ; preds = %if.end21
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !193
  br label %if.end28

if.end28:                                         ; preds = %if.else, %if.then25
  ret void, !dbg !195
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @inet_addr(i8*) #2

; Function Attrs: nounwind readnone willreturn
declare dso_local zeroext i16 @htons(i16 zeroext) #4

declare dso_local i32 @connect(i32, %struct.sockaddr*, i32) #5

declare dso_local i64 @recv(i32, i8*, i64, i32) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #6

declare dso_local i32 @close(i32) #5

declare dso_local void @printIntLine(i32) #5

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_32_good() #0 !dbg !196 {
entry:
  call void @goodG2B(), !dbg !197
  call void @goodB2G(), !dbg !198
  ret void, !dbg !199
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !200 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !205, metadata !DIExpression()), !dbg !206
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !207, metadata !DIExpression()), !dbg !208
  %call = call i64 @time(i64* null) #7, !dbg !209
  %conv = trunc i64 %call to i32, !dbg !210
  call void @srand(i32 %conv) #7, !dbg !211
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !212
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_32_good(), !dbg !213
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !214
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !215
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_32_bad(), !dbg !216
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !217
  ret i32 0, !dbg !218
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !219 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !220, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !222, metadata !DIExpression()), !dbg !223
  store i32* %data, i32** %dataPtr1, align 8, !dbg !223
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !224, metadata !DIExpression()), !dbg !225
  store i32* %data, i32** %dataPtr2, align 8, !dbg !225
  store i32 -1, i32* %data, align 4, !dbg !226
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !227, metadata !DIExpression()), !dbg !229
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !230
  %1 = load i32, i32* %0, align 4, !dbg !231
  store i32 %1, i32* %data1, align 4, !dbg !229
  store i32 7, i32* %data1, align 4, !dbg !232
  %2 = load i32, i32* %data1, align 4, !dbg !233
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !234
  store i32 %2, i32* %3, align 4, !dbg !235
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !236, metadata !DIExpression()), !dbg !238
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !239
  %5 = load i32, i32* %4, align 4, !dbg !240
  store i32 %5, i32* %data2, align 4, !dbg !238
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !241, metadata !DIExpression()), !dbg !243
  %6 = bitcast [10 x i32]* %buffer to i8*, !dbg !243
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false), !dbg !243
  %7 = load i32, i32* %data2, align 4, !dbg !244
  %cmp = icmp sge i32 %7, 0, !dbg !246
  br i1 %cmp, label %if.then, label %if.else, !dbg !247

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %data2, align 4, !dbg !248
  %idxprom = sext i32 %8 to i64, !dbg !250
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !250
  %9 = load i32, i32* %arrayidx, align 4, !dbg !250
  call void @printIntLine(i32 %9), !dbg !251
  br label %if.end, !dbg !252

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !253
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !255
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !256 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data22 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !257, metadata !DIExpression()), !dbg !258
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !259, metadata !DIExpression()), !dbg !260
  store i32* %data, i32** %dataPtr1, align 8, !dbg !260
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !261, metadata !DIExpression()), !dbg !262
  store i32* %data, i32** %dataPtr2, align 8, !dbg !262
  store i32 -1, i32* %data, align 4, !dbg !263
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !264, metadata !DIExpression()), !dbg !266
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !267
  %1 = load i32, i32* %0, align 4, !dbg !268
  store i32 %1, i32* %data1, align 4, !dbg !266
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !269, metadata !DIExpression()), !dbg !271
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !272, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !274, metadata !DIExpression()), !dbg !275
  store i32 -1, i32* %connectSocket, align 4, !dbg !275
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !276, metadata !DIExpression()), !dbg !277
  br label %do.body, !dbg !278

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !279
  store i32 %call, i32* %connectSocket, align 4, !dbg !281
  %2 = load i32, i32* %connectSocket, align 4, !dbg !282
  %cmp = icmp eq i32 %2, -1, !dbg !284
  br i1 %cmp, label %if.then, label %if.end, !dbg !285

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !286

if.end:                                           ; preds = %do.body
  %3 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !288
  call void @llvm.memset.p0i8.i64(i8* align 4 %3, i8 0, i64 16, i1 false), !dbg !288
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !289
  store i16 2, i16* %sin_family, align 4, !dbg !290
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !291
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !292
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !293
  store i32 %call2, i32* %s_addr, align 4, !dbg !294
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !295
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !296
  store i16 %call3, i16* %sin_port, align 2, !dbg !297
  %4 = load i32, i32* %connectSocket, align 4, !dbg !298
  %5 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !300
  %call4 = call i32 @connect(i32 %4, %struct.sockaddr* %5, i32 16), !dbg !301
  %cmp5 = icmp eq i32 %call4, -1, !dbg !302
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !303

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !304

if.end7:                                          ; preds = %if.end
  %6 = load i32, i32* %connectSocket, align 4, !dbg !306
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !307
  %call8 = call i64 @recv(i32 %6, i8* %arraydecay, i64 13, i32 0), !dbg !308
  %conv = trunc i64 %call8 to i32, !dbg !308
  store i32 %conv, i32* %recvResult, align 4, !dbg !309
  %7 = load i32, i32* %recvResult, align 4, !dbg !310
  %cmp9 = icmp eq i32 %7, -1, !dbg !312
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !313

lor.lhs.false:                                    ; preds = %if.end7
  %8 = load i32, i32* %recvResult, align 4, !dbg !314
  %cmp11 = icmp eq i32 %8, 0, !dbg !315
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !316

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !317

if.end14:                                         ; preds = %lor.lhs.false
  %9 = load i32, i32* %recvResult, align 4, !dbg !319
  %idxprom = sext i32 %9 to i64, !dbg !320
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !320
  store i8 0, i8* %arrayidx, align 1, !dbg !321
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !322
  %call16 = call i32 @atoi(i8* %arraydecay15) #9, !dbg !323
  store i32 %call16, i32* %data1, align 4, !dbg !324
  br label %do.end, !dbg !325

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then
  %10 = load i32, i32* %connectSocket, align 4, !dbg !326
  %cmp17 = icmp ne i32 %10, -1, !dbg !328
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !329

if.then19:                                        ; preds = %do.end
  %11 = load i32, i32* %connectSocket, align 4, !dbg !330
  %call20 = call i32 @close(i32 %11), !dbg !332
  br label %if.end21, !dbg !333

if.end21:                                         ; preds = %if.then19, %do.end
  %12 = load i32, i32* %data1, align 4, !dbg !334
  %13 = load i32*, i32** %dataPtr1, align 8, !dbg !335
  store i32 %12, i32* %13, align 4, !dbg !336
  call void @llvm.dbg.declare(metadata i32* %data22, metadata !337, metadata !DIExpression()), !dbg !339
  %14 = load i32*, i32** %dataPtr2, align 8, !dbg !340
  %15 = load i32, i32* %14, align 4, !dbg !341
  store i32 %15, i32* %data22, align 4, !dbg !339
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !342, metadata !DIExpression()), !dbg !344
  %16 = bitcast [10 x i32]* %buffer to i8*, !dbg !344
  call void @llvm.memset.p0i8.i64(i8* align 16 %16, i8 0, i64 40, i1 false), !dbg !344
  %17 = load i32, i32* %data22, align 4, !dbg !345
  %cmp23 = icmp sge i32 %17, 0, !dbg !347
  br i1 %cmp23, label %land.lhs.true, label %if.else, !dbg !348

land.lhs.true:                                    ; preds = %if.end21
  %18 = load i32, i32* %data22, align 4, !dbg !349
  %cmp25 = icmp slt i32 %18, 10, !dbg !350
  br i1 %cmp25, label %if.then27, label %if.else, !dbg !351

if.then27:                                        ; preds = %land.lhs.true
  %19 = load i32, i32* %data22, align 4, !dbg !352
  %idxprom28 = sext i32 %19 to i64, !dbg !354
  %arrayidx29 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom28, !dbg !354
  %20 = load i32, i32* %arrayidx29, align 4, !dbg !354
  call void @printIntLine(i32 %20), !dbg !355
  br label %if.end30, !dbg !356

if.else:                                          ; preds = %land.lhs.true, %if.end21
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !357
  br label %if.end30

if.end30:                                         ; preds = %if.else, %if.then27
  ret void, !dbg !359
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
!llvm.module.flags = !{!59, !60, !61, !62, !63}
!llvm.ident = !{!64}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_32.c", directory: "/root/SSE-Assessment")
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
!45 = !{!46, !5}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !48, line: 175, size: 128, elements: !49)
!48 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!49 = !{!50, !54}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !47, file: !48, line: 177, baseType: !51, size: 16)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !52, line: 28, baseType: !53)
!52 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!53 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !47, file: !48, line: 178, baseType: !55, size: 112, offset: 16)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 112, elements: !57)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !{!58}
!58 = !DISubrange(count: 14)
!59 = !{i32 7, !"Dwarf Version", i32 4}
!60 = !{i32 2, !"Debug Info Version", i32 3}
!61 = !{i32 1, !"wchar_size", i32 4}
!62 = !{i32 7, !"uwtable", i32 1}
!63 = !{i32 7, !"frame-pointer", i32 2}
!64 = !{!"clang version 13.0.0"}
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_32_bad", scope: !66, file: !66, line: 44, type: !67, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_32.c", directory: "/root/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 46, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 46, column: 9, scope: !65)
!73 = !DILocalVariable(name: "dataPtr1", scope: !65, file: !66, line: 47, type: !74)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!75 = !DILocation(line: 47, column: 10, scope: !65)
!76 = !DILocalVariable(name: "dataPtr2", scope: !65, file: !66, line: 48, type: !74)
!77 = !DILocation(line: 48, column: 10, scope: !65)
!78 = !DILocation(line: 50, column: 10, scope: !65)
!79 = !DILocalVariable(name: "data", scope: !80, file: !66, line: 52, type: !71)
!80 = distinct !DILexicalBlock(scope: !65, file: !66, line: 51, column: 5)
!81 = !DILocation(line: 52, column: 13, scope: !80)
!82 = !DILocation(line: 52, column: 21, scope: !80)
!83 = !DILocation(line: 52, column: 20, scope: !80)
!84 = !DILocalVariable(name: "recvResult", scope: !85, file: !66, line: 58, type: !71)
!85 = distinct !DILexicalBlock(scope: !80, file: !66, line: 53, column: 9)
!86 = !DILocation(line: 58, column: 17, scope: !85)
!87 = !DILocalVariable(name: "service", scope: !85, file: !66, line: 59, type: !88)
!88 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !89)
!89 = !{!90, !91, !97, !104}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !88, file: !17, line: 239, baseType: !51, size: 16)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !88, file: !17, line: 240, baseType: !92, size: 16, offset: 16)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !93)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !94, line: 25, baseType: !95)
!94 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !96, line: 39, baseType: !53)
!96 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!97 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !88, file: !17, line: 241, baseType: !98, size: 32, offset: 32)
!98 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !99)
!99 = !{!100}
!100 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !98, file: !17, line: 33, baseType: !101, size: 32)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !102)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !94, line: 26, baseType: !103)
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !96, line: 41, baseType: !5)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !88, file: !17, line: 244, baseType: !105, size: 64, offset: 64)
!105 = !DICompositeType(tag: DW_TAG_array_type, baseType: !106, size: 64, elements: !107)
!106 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!107 = !{!108}
!108 = !DISubrange(count: 8)
!109 = !DILocation(line: 59, column: 32, scope: !85)
!110 = !DILocalVariable(name: "connectSocket", scope: !85, file: !66, line: 60, type: !71)
!111 = !DILocation(line: 60, column: 20, scope: !85)
!112 = !DILocalVariable(name: "inputBuffer", scope: !85, file: !66, line: 61, type: !55)
!113 = !DILocation(line: 61, column: 18, scope: !85)
!114 = !DILocation(line: 62, column: 13, scope: !85)
!115 = !DILocation(line: 72, column: 33, scope: !116)
!116 = distinct !DILexicalBlock(scope: !85, file: !66, line: 63, column: 13)
!117 = !DILocation(line: 72, column: 31, scope: !116)
!118 = !DILocation(line: 73, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !66, line: 73, column: 21)
!120 = !DILocation(line: 73, column: 35, scope: !119)
!121 = !DILocation(line: 73, column: 21, scope: !116)
!122 = !DILocation(line: 75, column: 21, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !66, line: 74, column: 17)
!124 = !DILocation(line: 77, column: 17, scope: !116)
!125 = !DILocation(line: 78, column: 25, scope: !116)
!126 = !DILocation(line: 78, column: 36, scope: !116)
!127 = !DILocation(line: 79, column: 43, scope: !116)
!128 = !DILocation(line: 79, column: 25, scope: !116)
!129 = !DILocation(line: 79, column: 34, scope: !116)
!130 = !DILocation(line: 79, column: 41, scope: !116)
!131 = !DILocation(line: 80, column: 36, scope: !116)
!132 = !DILocation(line: 80, column: 25, scope: !116)
!133 = !DILocation(line: 80, column: 34, scope: !116)
!134 = !DILocation(line: 81, column: 29, scope: !135)
!135 = distinct !DILexicalBlock(scope: !116, file: !66, line: 81, column: 21)
!136 = !DILocation(line: 81, column: 44, scope: !135)
!137 = !DILocation(line: 81, column: 21, scope: !135)
!138 = !DILocation(line: 81, column: 89, scope: !135)
!139 = !DILocation(line: 81, column: 21, scope: !116)
!140 = !DILocation(line: 83, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !135, file: !66, line: 82, column: 17)
!142 = !DILocation(line: 87, column: 35, scope: !116)
!143 = !DILocation(line: 87, column: 50, scope: !116)
!144 = !DILocation(line: 87, column: 30, scope: !116)
!145 = !DILocation(line: 87, column: 28, scope: !116)
!146 = !DILocation(line: 88, column: 21, scope: !147)
!147 = distinct !DILexicalBlock(scope: !116, file: !66, line: 88, column: 21)
!148 = !DILocation(line: 88, column: 32, scope: !147)
!149 = !DILocation(line: 88, column: 48, scope: !147)
!150 = !DILocation(line: 88, column: 51, scope: !147)
!151 = !DILocation(line: 88, column: 62, scope: !147)
!152 = !DILocation(line: 88, column: 21, scope: !116)
!153 = !DILocation(line: 90, column: 21, scope: !154)
!154 = distinct !DILexicalBlock(scope: !147, file: !66, line: 89, column: 17)
!155 = !DILocation(line: 93, column: 29, scope: !116)
!156 = !DILocation(line: 93, column: 17, scope: !116)
!157 = !DILocation(line: 93, column: 41, scope: !116)
!158 = !DILocation(line: 95, column: 29, scope: !116)
!159 = !DILocation(line: 95, column: 24, scope: !116)
!160 = !DILocation(line: 95, column: 22, scope: !116)
!161 = !DILocation(line: 96, column: 13, scope: !116)
!162 = !DILocation(line: 98, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !85, file: !66, line: 98, column: 17)
!164 = !DILocation(line: 98, column: 31, scope: !163)
!165 = !DILocation(line: 98, column: 17, scope: !85)
!166 = !DILocation(line: 100, column: 30, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !66, line: 99, column: 13)
!168 = !DILocation(line: 100, column: 17, scope: !167)
!169 = !DILocation(line: 101, column: 13, scope: !167)
!170 = !DILocation(line: 109, column: 21, scope: !80)
!171 = !DILocation(line: 109, column: 10, scope: !80)
!172 = !DILocation(line: 109, column: 19, scope: !80)
!173 = !DILocalVariable(name: "data", scope: !174, file: !66, line: 112, type: !71)
!174 = distinct !DILexicalBlock(scope: !65, file: !66, line: 111, column: 5)
!175 = !DILocation(line: 112, column: 13, scope: !174)
!176 = !DILocation(line: 112, column: 21, scope: !174)
!177 = !DILocation(line: 112, column: 20, scope: !174)
!178 = !DILocalVariable(name: "buffer", scope: !179, file: !66, line: 114, type: !180)
!179 = distinct !DILexicalBlock(scope: !174, file: !66, line: 113, column: 9)
!180 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !181)
!181 = !{!182}
!182 = !DISubrange(count: 10)
!183 = !DILocation(line: 114, column: 17, scope: !179)
!184 = !DILocation(line: 117, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !179, file: !66, line: 117, column: 17)
!186 = !DILocation(line: 117, column: 22, scope: !185)
!187 = !DILocation(line: 117, column: 17, scope: !179)
!188 = !DILocation(line: 119, column: 37, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !66, line: 118, column: 13)
!190 = !DILocation(line: 119, column: 30, scope: !189)
!191 = !DILocation(line: 119, column: 17, scope: !189)
!192 = !DILocation(line: 120, column: 13, scope: !189)
!193 = !DILocation(line: 123, column: 17, scope: !194)
!194 = distinct !DILexicalBlock(scope: !185, file: !66, line: 122, column: 13)
!195 = !DILocation(line: 127, column: 1, scope: !65)
!196 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_32_good", scope: !66, file: !66, line: 251, type: !67, scopeLine: 252, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!197 = !DILocation(line: 253, column: 5, scope: !196)
!198 = !DILocation(line: 254, column: 5, scope: !196)
!199 = !DILocation(line: 255, column: 1, scope: !196)
!200 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 265, type: !201, scopeLine: 266, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!201 = !DISubroutineType(types: !202)
!202 = !{!71, !71, !203}
!203 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !204, size: 64)
!204 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!205 = !DILocalVariable(name: "argc", arg: 1, scope: !200, file: !66, line: 265, type: !71)
!206 = !DILocation(line: 265, column: 14, scope: !200)
!207 = !DILocalVariable(name: "argv", arg: 2, scope: !200, file: !66, line: 265, type: !203)
!208 = !DILocation(line: 265, column: 27, scope: !200)
!209 = !DILocation(line: 268, column: 22, scope: !200)
!210 = !DILocation(line: 268, column: 12, scope: !200)
!211 = !DILocation(line: 268, column: 5, scope: !200)
!212 = !DILocation(line: 270, column: 5, scope: !200)
!213 = !DILocation(line: 271, column: 5, scope: !200)
!214 = !DILocation(line: 272, column: 5, scope: !200)
!215 = !DILocation(line: 275, column: 5, scope: !200)
!216 = !DILocation(line: 276, column: 5, scope: !200)
!217 = !DILocation(line: 277, column: 5, scope: !200)
!218 = !DILocation(line: 279, column: 5, scope: !200)
!219 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 134, type: !67, scopeLine: 135, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!220 = !DILocalVariable(name: "data", scope: !219, file: !66, line: 136, type: !71)
!221 = !DILocation(line: 136, column: 9, scope: !219)
!222 = !DILocalVariable(name: "dataPtr1", scope: !219, file: !66, line: 137, type: !74)
!223 = !DILocation(line: 137, column: 10, scope: !219)
!224 = !DILocalVariable(name: "dataPtr2", scope: !219, file: !66, line: 138, type: !74)
!225 = !DILocation(line: 138, column: 10, scope: !219)
!226 = !DILocation(line: 140, column: 10, scope: !219)
!227 = !DILocalVariable(name: "data", scope: !228, file: !66, line: 142, type: !71)
!228 = distinct !DILexicalBlock(scope: !219, file: !66, line: 141, column: 5)
!229 = !DILocation(line: 142, column: 13, scope: !228)
!230 = !DILocation(line: 142, column: 21, scope: !228)
!231 = !DILocation(line: 142, column: 20, scope: !228)
!232 = !DILocation(line: 145, column: 14, scope: !228)
!233 = !DILocation(line: 146, column: 21, scope: !228)
!234 = !DILocation(line: 146, column: 10, scope: !228)
!235 = !DILocation(line: 146, column: 19, scope: !228)
!236 = !DILocalVariable(name: "data", scope: !237, file: !66, line: 149, type: !71)
!237 = distinct !DILexicalBlock(scope: !219, file: !66, line: 148, column: 5)
!238 = !DILocation(line: 149, column: 13, scope: !237)
!239 = !DILocation(line: 149, column: 21, scope: !237)
!240 = !DILocation(line: 149, column: 20, scope: !237)
!241 = !DILocalVariable(name: "buffer", scope: !242, file: !66, line: 151, type: !180)
!242 = distinct !DILexicalBlock(scope: !237, file: !66, line: 150, column: 9)
!243 = !DILocation(line: 151, column: 17, scope: !242)
!244 = !DILocation(line: 154, column: 17, scope: !245)
!245 = distinct !DILexicalBlock(scope: !242, file: !66, line: 154, column: 17)
!246 = !DILocation(line: 154, column: 22, scope: !245)
!247 = !DILocation(line: 154, column: 17, scope: !242)
!248 = !DILocation(line: 156, column: 37, scope: !249)
!249 = distinct !DILexicalBlock(scope: !245, file: !66, line: 155, column: 13)
!250 = !DILocation(line: 156, column: 30, scope: !249)
!251 = !DILocation(line: 156, column: 17, scope: !249)
!252 = !DILocation(line: 157, column: 13, scope: !249)
!253 = !DILocation(line: 160, column: 17, scope: !254)
!254 = distinct !DILexicalBlock(scope: !245, file: !66, line: 159, column: 13)
!255 = !DILocation(line: 164, column: 1, scope: !219)
!256 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 167, type: !67, scopeLine: 168, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!257 = !DILocalVariable(name: "data", scope: !256, file: !66, line: 169, type: !71)
!258 = !DILocation(line: 169, column: 9, scope: !256)
!259 = !DILocalVariable(name: "dataPtr1", scope: !256, file: !66, line: 170, type: !74)
!260 = !DILocation(line: 170, column: 10, scope: !256)
!261 = !DILocalVariable(name: "dataPtr2", scope: !256, file: !66, line: 171, type: !74)
!262 = !DILocation(line: 171, column: 10, scope: !256)
!263 = !DILocation(line: 173, column: 10, scope: !256)
!264 = !DILocalVariable(name: "data", scope: !265, file: !66, line: 175, type: !71)
!265 = distinct !DILexicalBlock(scope: !256, file: !66, line: 174, column: 5)
!266 = !DILocation(line: 175, column: 13, scope: !265)
!267 = !DILocation(line: 175, column: 21, scope: !265)
!268 = !DILocation(line: 175, column: 20, scope: !265)
!269 = !DILocalVariable(name: "recvResult", scope: !270, file: !66, line: 181, type: !71)
!270 = distinct !DILexicalBlock(scope: !265, file: !66, line: 176, column: 9)
!271 = !DILocation(line: 181, column: 17, scope: !270)
!272 = !DILocalVariable(name: "service", scope: !270, file: !66, line: 182, type: !88)
!273 = !DILocation(line: 182, column: 32, scope: !270)
!274 = !DILocalVariable(name: "connectSocket", scope: !270, file: !66, line: 183, type: !71)
!275 = !DILocation(line: 183, column: 20, scope: !270)
!276 = !DILocalVariable(name: "inputBuffer", scope: !270, file: !66, line: 184, type: !55)
!277 = !DILocation(line: 184, column: 18, scope: !270)
!278 = !DILocation(line: 185, column: 13, scope: !270)
!279 = !DILocation(line: 195, column: 33, scope: !280)
!280 = distinct !DILexicalBlock(scope: !270, file: !66, line: 186, column: 13)
!281 = !DILocation(line: 195, column: 31, scope: !280)
!282 = !DILocation(line: 196, column: 21, scope: !283)
!283 = distinct !DILexicalBlock(scope: !280, file: !66, line: 196, column: 21)
!284 = !DILocation(line: 196, column: 35, scope: !283)
!285 = !DILocation(line: 196, column: 21, scope: !280)
!286 = !DILocation(line: 198, column: 21, scope: !287)
!287 = distinct !DILexicalBlock(scope: !283, file: !66, line: 197, column: 17)
!288 = !DILocation(line: 200, column: 17, scope: !280)
!289 = !DILocation(line: 201, column: 25, scope: !280)
!290 = !DILocation(line: 201, column: 36, scope: !280)
!291 = !DILocation(line: 202, column: 43, scope: !280)
!292 = !DILocation(line: 202, column: 25, scope: !280)
!293 = !DILocation(line: 202, column: 34, scope: !280)
!294 = !DILocation(line: 202, column: 41, scope: !280)
!295 = !DILocation(line: 203, column: 36, scope: !280)
!296 = !DILocation(line: 203, column: 25, scope: !280)
!297 = !DILocation(line: 203, column: 34, scope: !280)
!298 = !DILocation(line: 204, column: 29, scope: !299)
!299 = distinct !DILexicalBlock(scope: !280, file: !66, line: 204, column: 21)
!300 = !DILocation(line: 204, column: 44, scope: !299)
!301 = !DILocation(line: 204, column: 21, scope: !299)
!302 = !DILocation(line: 204, column: 89, scope: !299)
!303 = !DILocation(line: 204, column: 21, scope: !280)
!304 = !DILocation(line: 206, column: 21, scope: !305)
!305 = distinct !DILexicalBlock(scope: !299, file: !66, line: 205, column: 17)
!306 = !DILocation(line: 210, column: 35, scope: !280)
!307 = !DILocation(line: 210, column: 50, scope: !280)
!308 = !DILocation(line: 210, column: 30, scope: !280)
!309 = !DILocation(line: 210, column: 28, scope: !280)
!310 = !DILocation(line: 211, column: 21, scope: !311)
!311 = distinct !DILexicalBlock(scope: !280, file: !66, line: 211, column: 21)
!312 = !DILocation(line: 211, column: 32, scope: !311)
!313 = !DILocation(line: 211, column: 48, scope: !311)
!314 = !DILocation(line: 211, column: 51, scope: !311)
!315 = !DILocation(line: 211, column: 62, scope: !311)
!316 = !DILocation(line: 211, column: 21, scope: !280)
!317 = !DILocation(line: 213, column: 21, scope: !318)
!318 = distinct !DILexicalBlock(scope: !311, file: !66, line: 212, column: 17)
!319 = !DILocation(line: 216, column: 29, scope: !280)
!320 = !DILocation(line: 216, column: 17, scope: !280)
!321 = !DILocation(line: 216, column: 41, scope: !280)
!322 = !DILocation(line: 218, column: 29, scope: !280)
!323 = !DILocation(line: 218, column: 24, scope: !280)
!324 = !DILocation(line: 218, column: 22, scope: !280)
!325 = !DILocation(line: 219, column: 13, scope: !280)
!326 = !DILocation(line: 221, column: 17, scope: !327)
!327 = distinct !DILexicalBlock(scope: !270, file: !66, line: 221, column: 17)
!328 = !DILocation(line: 221, column: 31, scope: !327)
!329 = !DILocation(line: 221, column: 17, scope: !270)
!330 = !DILocation(line: 223, column: 30, scope: !331)
!331 = distinct !DILexicalBlock(scope: !327, file: !66, line: 222, column: 13)
!332 = !DILocation(line: 223, column: 17, scope: !331)
!333 = !DILocation(line: 224, column: 13, scope: !331)
!334 = !DILocation(line: 232, column: 21, scope: !265)
!335 = !DILocation(line: 232, column: 10, scope: !265)
!336 = !DILocation(line: 232, column: 19, scope: !265)
!337 = !DILocalVariable(name: "data", scope: !338, file: !66, line: 235, type: !71)
!338 = distinct !DILexicalBlock(scope: !256, file: !66, line: 234, column: 5)
!339 = !DILocation(line: 235, column: 13, scope: !338)
!340 = !DILocation(line: 235, column: 21, scope: !338)
!341 = !DILocation(line: 235, column: 20, scope: !338)
!342 = !DILocalVariable(name: "buffer", scope: !343, file: !66, line: 237, type: !180)
!343 = distinct !DILexicalBlock(scope: !338, file: !66, line: 236, column: 9)
!344 = !DILocation(line: 237, column: 17, scope: !343)
!345 = !DILocation(line: 239, column: 17, scope: !346)
!346 = distinct !DILexicalBlock(scope: !343, file: !66, line: 239, column: 17)
!347 = !DILocation(line: 239, column: 22, scope: !346)
!348 = !DILocation(line: 239, column: 27, scope: !346)
!349 = !DILocation(line: 239, column: 30, scope: !346)
!350 = !DILocation(line: 239, column: 35, scope: !346)
!351 = !DILocation(line: 239, column: 17, scope: !343)
!352 = !DILocation(line: 241, column: 37, scope: !353)
!353 = distinct !DILexicalBlock(scope: !346, file: !66, line: 240, column: 13)
!354 = !DILocation(line: 241, column: 30, scope: !353)
!355 = !DILocation(line: 241, column: 17, scope: !353)
!356 = !DILocation(line: 242, column: 13, scope: !353)
!357 = !DILocation(line: 245, column: 17, scope: !358)
!358 = distinct !DILexicalBlock(scope: !346, file: !66, line: 244, column: 13)
!359 = !DILocation(line: 249, column: 1, scope: !256)
