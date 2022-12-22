; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_18.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_18_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  br label %source, !dbg !25

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !26), !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !31
  %0 = bitcast i8* %call to i32*, !dbg !32
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !30
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !33
  %cmp = icmp eq i32* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #8, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %source
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !39
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !40
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !43
  %5 = bitcast i32* %4 to i8*, !dbg !44
  store i8* %5, i8** %data, align 8, !dbg !45
  br label %sink, !dbg !46

sink:                                             ; preds = %if.end
  call void @llvm.dbg.label(metadata !47), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !49, metadata !DIExpression()), !dbg !53
  %6 = load i8*, i8** %data, align 8, !dbg !54
  %call2 = call i64 @strlen(i8* %6) #9, !dbg !55
  store i64 %call2, i64* %dataLen, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !56, metadata !DIExpression()), !dbg !57
  %7 = load i64, i64* %dataLen, align 8, !dbg !58
  %add = add i64 %7, 1, !dbg !59
  %call3 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !60
  store i8* %call3, i8** %dest, align 8, !dbg !57
  %8 = load i8*, i8** %dest, align 8, !dbg !61
  %cmp4 = icmp eq i8* %8, null, !dbg !63
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !64

if.then5:                                         ; preds = %sink
  call void @exit(i32 -1) #8, !dbg !65
  unreachable, !dbg !65

if.end6:                                          ; preds = %sink
  %9 = load i8*, i8** %dest, align 8, !dbg !67
  %10 = bitcast i8* %9 to i32*, !dbg !67
  %11 = load i8*, i8** %data, align 8, !dbg !68
  %12 = bitcast i8* %11 to i32*, !dbg !68
  %call7 = call i32* @wcscpy(i32* %10, i32* %12) #7, !dbg !69
  %13 = load i8*, i8** %dest, align 8, !dbg !70
  call void @printLine(i8* %13), !dbg !71
  %14 = load i8*, i8** %dest, align 8, !dbg !72
  call void @free(i8* %14) #7, !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @calloc(i64, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_18_good() #0 !dbg !75 {
entry:
  call void @goodB2G(), !dbg !76
  call void @goodG2B(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #7, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #7, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_18_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_18_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  store i8* null, i8** %data, align 8, !dbg !100
  br label %source, !dbg !101

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !102), !dbg !103
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !106
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !107
  %0 = bitcast i8* %call to i32*, !dbg !108
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !106
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !109
  %cmp = icmp eq i32* %1, null, !dbg !111
  br i1 %cmp, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #8, !dbg !113
  unreachable, !dbg !113

if.end:                                           ; preds = %source
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !115
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !116
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !117
  store i32 0, i32* %arrayidx, align 4, !dbg !118
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !119
  %5 = bitcast i32* %4 to i8*, !dbg !120
  store i8* %5, i8** %data, align 8, !dbg !121
  br label %sink, !dbg !122

sink:                                             ; preds = %if.end
  call void @llvm.dbg.label(metadata !123), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !125, metadata !DIExpression()), !dbg !127
  %6 = load i8*, i8** %data, align 8, !dbg !128
  %7 = bitcast i8* %6 to i32*, !dbg !129
  %call2 = call i64 @wcslen(i32* %7) #9, !dbg !130
  store i64 %call2, i64* %dataLen, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !131, metadata !DIExpression()), !dbg !132
  %8 = load i64, i64* %dataLen, align 8, !dbg !133
  %add = add i64 %8, 1, !dbg !134
  %call3 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !135
  store i8* %call3, i8** %dest, align 8, !dbg !132
  %9 = load i8*, i8** %dest, align 8, !dbg !136
  %cmp4 = icmp eq i8* %9, null, !dbg !138
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !139

if.then5:                                         ; preds = %sink
  call void @exit(i32 -1) #8, !dbg !140
  unreachable, !dbg !140

if.end6:                                          ; preds = %sink
  %10 = load i8*, i8** %dest, align 8, !dbg !142
  %11 = bitcast i8* %10 to i32*, !dbg !142
  %12 = load i8*, i8** %data, align 8, !dbg !143
  %13 = bitcast i8* %12 to i32*, !dbg !143
  %call7 = call i32* @wcscpy(i32* %11, i32* %13) #7, !dbg !144
  %14 = load i8*, i8** %dest, align 8, !dbg !145
  %15 = bitcast i8* %14 to i32*, !dbg !146
  call void @printWLine(i32* %15), !dbg !147
  %16 = load i8*, i8** %dest, align 8, !dbg !148
  call void @free(i8* %16) #7, !dbg !149
  ret void, !dbg !150
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !151 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !152, metadata !DIExpression()), !dbg !153
  store i8* null, i8** %data, align 8, !dbg !154
  br label %source, !dbg !155

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !156), !dbg !157
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !158, metadata !DIExpression()), !dbg !160
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !161
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !160
  %0 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !162
  %cmp = icmp eq i8* %0, null, !dbg !164
  br i1 %cmp, label %if.then, label %if.end, !dbg !165

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #8, !dbg !166
  unreachable, !dbg !166

if.end:                                           ; preds = %source
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !168
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !169
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !170
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !170
  store i8 0, i8* %arrayidx, align 1, !dbg !171
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !172
  store i8* %3, i8** %data, align 8, !dbg !173
  br label %sink, !dbg !174

sink:                                             ; preds = %if.end
  call void @llvm.dbg.label(metadata !175), !dbg !176
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !177, metadata !DIExpression()), !dbg !179
  %4 = load i8*, i8** %data, align 8, !dbg !180
  %call1 = call i64 @strlen(i8* %4) #9, !dbg !181
  store i64 %call1, i64* %dataLen, align 8, !dbg !179
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !182, metadata !DIExpression()), !dbg !183
  %5 = load i64, i64* %dataLen, align 8, !dbg !184
  %add = add i64 %5, 1, !dbg !185
  %call2 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !186
  store i8* %call2, i8** %dest, align 8, !dbg !183
  %6 = load i8*, i8** %dest, align 8, !dbg !187
  %cmp3 = icmp eq i8* %6, null, !dbg !189
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !190

if.then4:                                         ; preds = %sink
  call void @exit(i32 -1) #8, !dbg !191
  unreachable, !dbg !191

if.end5:                                          ; preds = %sink
  %7 = load i8*, i8** %dest, align 8, !dbg !193
  %8 = load i8*, i8** %data, align 8, !dbg !194
  %call6 = call i8* @strcpy(i8* %7, i8* %8) #7, !dbg !195
  %9 = load i8*, i8** %dest, align 8, !dbg !196
  call void @printLine(i8* %9), !dbg !197
  %10 = load i8*, i8** %dest, align 8, !dbg !198
  call void @free(i8* %10) #7, !dbg !199
  ret void, !dbg !200
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn writeonly }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_18.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9, !11}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_18_bad", scope: !19, file: !19, line: 24, type: !20, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_18.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 26, type: !4)
!23 = !DILocation(line: 26, column: 12, scope: !18)
!24 = !DILocation(line: 27, column: 10, scope: !18)
!25 = !DILocation(line: 28, column: 5, scope: !18)
!26 = !DILabel(scope: !18, name: "source", file: !19, line: 29)
!27 = !DILocation(line: 29, column: 1, scope: !18)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !29, file: !19, line: 31, type: !5)
!29 = distinct !DILexicalBlock(scope: !18, file: !19, line: 30, column: 5)
!30 = !DILocation(line: 31, column: 19, scope: !29)
!31 = !DILocation(line: 31, column: 46, scope: !29)
!32 = !DILocation(line: 31, column: 35, scope: !29)
!33 = !DILocation(line: 32, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !29, file: !19, line: 32, column: 13)
!35 = !DILocation(line: 32, column: 27, scope: !34)
!36 = !DILocation(line: 32, column: 13, scope: !29)
!37 = !DILocation(line: 32, column: 37, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !19, line: 32, column: 36)
!39 = !DILocation(line: 33, column: 17, scope: !29)
!40 = !DILocation(line: 33, column: 9, scope: !29)
!41 = !DILocation(line: 34, column: 9, scope: !29)
!42 = !DILocation(line: 34, column: 29, scope: !29)
!43 = !DILocation(line: 36, column: 24, scope: !29)
!44 = !DILocation(line: 36, column: 16, scope: !29)
!45 = !DILocation(line: 36, column: 14, scope: !29)
!46 = !DILocation(line: 38, column: 5, scope: !18)
!47 = !DILabel(scope: !18, name: "sink", file: !19, line: 39)
!48 = !DILocation(line: 39, column: 1, scope: !18)
!49 = !DILocalVariable(name: "dataLen", scope: !50, file: !19, line: 42, type: !51)
!50 = distinct !DILexicalBlock(scope: !18, file: !19, line: 40, column: 5)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !52)
!52 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 42, column: 16, scope: !50)
!54 = !DILocation(line: 42, column: 41, scope: !50)
!55 = !DILocation(line: 42, column: 26, scope: !50)
!56 = !DILocalVariable(name: "dest", scope: !50, file: !19, line: 43, type: !4)
!57 = !DILocation(line: 43, column: 16, scope: !50)
!58 = !DILocation(line: 43, column: 38, scope: !50)
!59 = !DILocation(line: 43, column: 45, scope: !50)
!60 = !DILocation(line: 43, column: 31, scope: !50)
!61 = !DILocation(line: 44, column: 13, scope: !62)
!62 = distinct !DILexicalBlock(scope: !50, file: !19, line: 44, column: 13)
!63 = !DILocation(line: 44, column: 18, scope: !62)
!64 = !DILocation(line: 44, column: 13, scope: !50)
!65 = !DILocation(line: 44, column: 28, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !19, line: 44, column: 27)
!67 = !DILocation(line: 45, column: 22, scope: !50)
!68 = !DILocation(line: 45, column: 28, scope: !50)
!69 = !DILocation(line: 45, column: 15, scope: !50)
!70 = !DILocation(line: 46, column: 27, scope: !50)
!71 = !DILocation(line: 46, column: 9, scope: !50)
!72 = !DILocation(line: 47, column: 14, scope: !50)
!73 = !DILocation(line: 47, column: 9, scope: !50)
!74 = !DILocation(line: 49, column: 1, scope: !18)
!75 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_18_good", scope: !19, file: !19, line: 111, type: !20, scopeLine: 112, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 113, column: 5, scope: !75)
!77 = !DILocation(line: 114, column: 5, scope: !75)
!78 = !DILocation(line: 115, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 126, type: !80, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!8, !8, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !19, line: 126, type: !8)
!84 = !DILocation(line: 126, column: 14, scope: !79)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !19, line: 126, type: !82)
!86 = !DILocation(line: 126, column: 27, scope: !79)
!87 = !DILocation(line: 129, column: 22, scope: !79)
!88 = !DILocation(line: 129, column: 12, scope: !79)
!89 = !DILocation(line: 129, column: 5, scope: !79)
!90 = !DILocation(line: 131, column: 5, scope: !79)
!91 = !DILocation(line: 132, column: 5, scope: !79)
!92 = !DILocation(line: 133, column: 5, scope: !79)
!93 = !DILocation(line: 136, column: 5, scope: !79)
!94 = !DILocation(line: 137, column: 5, scope: !79)
!95 = !DILocation(line: 138, column: 5, scope: !79)
!96 = !DILocation(line: 140, column: 5, scope: !79)
!97 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 56, type: !20, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !19, line: 58, type: !4)
!99 = !DILocation(line: 58, column: 12, scope: !97)
!100 = !DILocation(line: 59, column: 10, scope: !97)
!101 = !DILocation(line: 60, column: 5, scope: !97)
!102 = !DILabel(scope: !97, name: "source", file: !19, line: 61)
!103 = !DILocation(line: 61, column: 1, scope: !97)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !19, line: 63, type: !5)
!105 = distinct !DILexicalBlock(scope: !97, file: !19, line: 62, column: 5)
!106 = !DILocation(line: 63, column: 19, scope: !105)
!107 = !DILocation(line: 63, column: 46, scope: !105)
!108 = !DILocation(line: 63, column: 35, scope: !105)
!109 = !DILocation(line: 64, column: 13, scope: !110)
!110 = distinct !DILexicalBlock(scope: !105, file: !19, line: 64, column: 13)
!111 = !DILocation(line: 64, column: 27, scope: !110)
!112 = !DILocation(line: 64, column: 13, scope: !105)
!113 = !DILocation(line: 64, column: 37, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !19, line: 64, column: 36)
!115 = !DILocation(line: 65, column: 17, scope: !105)
!116 = !DILocation(line: 65, column: 9, scope: !105)
!117 = !DILocation(line: 66, column: 9, scope: !105)
!118 = !DILocation(line: 66, column: 29, scope: !105)
!119 = !DILocation(line: 68, column: 24, scope: !105)
!120 = !DILocation(line: 68, column: 16, scope: !105)
!121 = !DILocation(line: 68, column: 14, scope: !105)
!122 = !DILocation(line: 70, column: 5, scope: !97)
!123 = !DILabel(scope: !97, name: "sink", file: !19, line: 71)
!124 = !DILocation(line: 71, column: 1, scope: !97)
!125 = !DILocalVariable(name: "dataLen", scope: !126, file: !19, line: 74, type: !51)
!126 = distinct !DILexicalBlock(scope: !97, file: !19, line: 72, column: 5)
!127 = !DILocation(line: 74, column: 16, scope: !126)
!128 = !DILocation(line: 74, column: 44, scope: !126)
!129 = !DILocation(line: 74, column: 33, scope: !126)
!130 = !DILocation(line: 74, column: 26, scope: !126)
!131 = !DILocalVariable(name: "dest", scope: !126, file: !19, line: 75, type: !4)
!132 = !DILocation(line: 75, column: 16, scope: !126)
!133 = !DILocation(line: 75, column: 38, scope: !126)
!134 = !DILocation(line: 75, column: 45, scope: !126)
!135 = !DILocation(line: 75, column: 31, scope: !126)
!136 = !DILocation(line: 76, column: 13, scope: !137)
!137 = distinct !DILexicalBlock(scope: !126, file: !19, line: 76, column: 13)
!138 = !DILocation(line: 76, column: 18, scope: !137)
!139 = !DILocation(line: 76, column: 13, scope: !126)
!140 = !DILocation(line: 76, column: 28, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !19, line: 76, column: 27)
!142 = !DILocation(line: 77, column: 22, scope: !126)
!143 = !DILocation(line: 77, column: 28, scope: !126)
!144 = !DILocation(line: 77, column: 15, scope: !126)
!145 = !DILocation(line: 78, column: 31, scope: !126)
!146 = !DILocation(line: 78, column: 20, scope: !126)
!147 = !DILocation(line: 78, column: 9, scope: !126)
!148 = !DILocation(line: 79, column: 14, scope: !126)
!149 = !DILocation(line: 79, column: 9, scope: !126)
!150 = !DILocation(line: 81, column: 1, scope: !97)
!151 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 84, type: !20, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!152 = !DILocalVariable(name: "data", scope: !151, file: !19, line: 86, type: !4)
!153 = !DILocation(line: 86, column: 12, scope: !151)
!154 = !DILocation(line: 87, column: 10, scope: !151)
!155 = !DILocation(line: 88, column: 5, scope: !151)
!156 = !DILabel(scope: !151, name: "source", file: !19, line: 89)
!157 = !DILocation(line: 89, column: 1, scope: !151)
!158 = !DILocalVariable(name: "dataGoodBuffer", scope: !159, file: !19, line: 91, type: !9)
!159 = distinct !DILexicalBlock(scope: !151, file: !19, line: 90, column: 5)
!160 = !DILocation(line: 91, column: 16, scope: !159)
!161 = !DILocation(line: 91, column: 41, scope: !159)
!162 = !DILocation(line: 92, column: 13, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !19, line: 92, column: 13)
!164 = !DILocation(line: 92, column: 28, scope: !163)
!165 = !DILocation(line: 92, column: 13, scope: !159)
!166 = !DILocation(line: 92, column: 38, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !19, line: 92, column: 37)
!168 = !DILocation(line: 93, column: 16, scope: !159)
!169 = !DILocation(line: 93, column: 9, scope: !159)
!170 = !DILocation(line: 94, column: 9, scope: !159)
!171 = !DILocation(line: 94, column: 30, scope: !159)
!172 = !DILocation(line: 96, column: 24, scope: !159)
!173 = !DILocation(line: 96, column: 14, scope: !159)
!174 = !DILocation(line: 98, column: 5, scope: !151)
!175 = !DILabel(scope: !151, name: "sink", file: !19, line: 99)
!176 = !DILocation(line: 99, column: 1, scope: !151)
!177 = !DILocalVariable(name: "dataLen", scope: !178, file: !19, line: 102, type: !51)
!178 = distinct !DILexicalBlock(scope: !151, file: !19, line: 100, column: 5)
!179 = !DILocation(line: 102, column: 16, scope: !178)
!180 = !DILocation(line: 102, column: 41, scope: !178)
!181 = !DILocation(line: 102, column: 26, scope: !178)
!182 = !DILocalVariable(name: "dest", scope: !178, file: !19, line: 103, type: !4)
!183 = !DILocation(line: 103, column: 16, scope: !178)
!184 = !DILocation(line: 103, column: 38, scope: !178)
!185 = !DILocation(line: 103, column: 45, scope: !178)
!186 = !DILocation(line: 103, column: 31, scope: !178)
!187 = !DILocation(line: 104, column: 13, scope: !188)
!188 = distinct !DILexicalBlock(scope: !178, file: !19, line: 104, column: 13)
!189 = !DILocation(line: 104, column: 18, scope: !188)
!190 = !DILocation(line: 104, column: 13, scope: !178)
!191 = !DILocation(line: 104, column: 28, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !19, line: 104, column: 27)
!193 = !DILocation(line: 105, column: 22, scope: !178)
!194 = !DILocation(line: 105, column: 28, scope: !178)
!195 = !DILocation(line: 105, column: 15, scope: !178)
!196 = !DILocation(line: 106, column: 27, scope: !178)
!197 = !DILocation(line: 106, column: 9, scope: !178)
!198 = !DILocation(line: 107, column: 14, scope: !178)
!199 = !DILocation(line: 107, column: 9, scope: !178)
!200 = !DILocation(line: 109, column: 1, scope: !151)
