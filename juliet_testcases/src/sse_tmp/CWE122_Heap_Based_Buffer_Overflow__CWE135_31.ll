; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_31_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataCopy = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !27
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !37
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !40
  %5 = bitcast i32* %4 to i8*, !dbg !41
  store i8* %5, i8** %data, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !43, metadata !DIExpression()), !dbg !45
  %6 = load i8*, i8** %data, align 8, !dbg !46
  store i8* %6, i8** %dataCopy, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !47, metadata !DIExpression()), !dbg !48
  %7 = load i8*, i8** %dataCopy, align 8, !dbg !49
  store i8* %7, i8** %data2, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !50, metadata !DIExpression()), !dbg !54
  %8 = load i8*, i8** %data2, align 8, !dbg !55
  %call3 = call i64 @strlen(i8* %8) #9, !dbg !56
  store i64 %call3, i64* %dataLen, align 8, !dbg !54
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !57, metadata !DIExpression()), !dbg !58
  %9 = load i64, i64* %dataLen, align 8, !dbg !59
  %add = add i64 %9, 1, !dbg !60
  %call4 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !61
  store i8* %call4, i8** %dest, align 8, !dbg !58
  %10 = load i8*, i8** %dest, align 8, !dbg !62
  %cmp5 = icmp eq i8* %10, null, !dbg !64
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !65

if.then6:                                         ; preds = %if.end
  call void @exit(i32 -1) #8, !dbg !66
  unreachable, !dbg !66

if.end7:                                          ; preds = %if.end
  %11 = load i8*, i8** %dest, align 8, !dbg !68
  %12 = bitcast i8* %11 to i32*, !dbg !68
  %13 = load i8*, i8** %data2, align 8, !dbg !69
  %14 = bitcast i8* %13 to i32*, !dbg !69
  %call8 = call i32* @wcscpy(i32* %12, i32* %14) #7, !dbg !70
  %15 = load i8*, i8** %dest, align 8, !dbg !71
  call void @printLine(i8* %15), !dbg !72
  %16 = load i8*, i8** %dest, align 8, !dbg !73
  call void @free(i8* %16) #7, !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_31_good() #0 !dbg !76 {
entry:
  call void @goodG2B(), !dbg !77
  call void @goodB2G(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #7, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #7, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_31_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_31_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !99, metadata !DIExpression()), !dbg !100
  store i8* null, i8** %data, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !102, metadata !DIExpression()), !dbg !104
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !105
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !104
  %0 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !106
  %cmp = icmp eq i8* %0, null, !dbg !108
  br i1 %cmp, label %if.then, label %if.end, !dbg !109

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !110
  unreachable, !dbg !110

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !113
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !116
  store i8* %3, i8** %data, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !118, metadata !DIExpression()), !dbg !120
  %4 = load i8*, i8** %data, align 8, !dbg !121
  store i8* %4, i8** %dataCopy, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !122, metadata !DIExpression()), !dbg !123
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !124
  store i8* %5, i8** %data1, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !125, metadata !DIExpression()), !dbg !127
  %6 = load i8*, i8** %data1, align 8, !dbg !128
  %call2 = call i64 @strlen(i8* %6) #9, !dbg !129
  store i64 %call2, i64* %dataLen, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !130, metadata !DIExpression()), !dbg !131
  %7 = load i64, i64* %dataLen, align 8, !dbg !132
  %add = add i64 %7, 1, !dbg !133
  %call3 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !134
  store i8* %call3, i8** %dest, align 8, !dbg !131
  %8 = load i8*, i8** %dest, align 8, !dbg !135
  %cmp4 = icmp eq i8* %8, null, !dbg !137
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !138

if.then5:                                         ; preds = %if.end
  call void @exit(i32 -1) #8, !dbg !139
  unreachable, !dbg !139

if.end6:                                          ; preds = %if.end
  %9 = load i8*, i8** %dest, align 8, !dbg !141
  %10 = load i8*, i8** %data1, align 8, !dbg !142
  %call7 = call i8* @strcpy(i8* %9, i8* %10) #7, !dbg !143
  %11 = load i8*, i8** %dest, align 8, !dbg !144
  call void @printLine(i8* %11), !dbg !145
  %12 = load i8*, i8** %dest, align 8, !dbg !146
  call void @free(i8* %12) #7, !dbg !147
  ret void, !dbg !148
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !149 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataCopy = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !150, metadata !DIExpression()), !dbg !151
  store i8* null, i8** %data, align 8, !dbg !152
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !153, metadata !DIExpression()), !dbg !155
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !156
  %0 = bitcast i8* %call to i32*, !dbg !157
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !155
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !158
  %cmp = icmp eq i32* %1, null, !dbg !160
  br i1 %cmp, label %if.then, label %if.end, !dbg !161

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !162
  unreachable, !dbg !162

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !164
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !165
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !166
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !166
  store i32 0, i32* %arrayidx, align 4, !dbg !167
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !168
  %5 = bitcast i32* %4 to i8*, !dbg !169
  store i8* %5, i8** %data, align 8, !dbg !170
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !171, metadata !DIExpression()), !dbg !173
  %6 = load i8*, i8** %data, align 8, !dbg !174
  store i8* %6, i8** %dataCopy, align 8, !dbg !173
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !175, metadata !DIExpression()), !dbg !176
  %7 = load i8*, i8** %dataCopy, align 8, !dbg !177
  store i8* %7, i8** %data2, align 8, !dbg !176
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !178, metadata !DIExpression()), !dbg !180
  %8 = load i8*, i8** %data2, align 8, !dbg !181
  %9 = bitcast i8* %8 to i32*, !dbg !182
  %call3 = call i64 @wcslen(i32* %9) #9, !dbg !183
  store i64 %call3, i64* %dataLen, align 8, !dbg !180
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !184, metadata !DIExpression()), !dbg !185
  %10 = load i64, i64* %dataLen, align 8, !dbg !186
  %add = add i64 %10, 1, !dbg !187
  %call4 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !188
  store i8* %call4, i8** %dest, align 8, !dbg !185
  %11 = load i8*, i8** %dest, align 8, !dbg !189
  %cmp5 = icmp eq i8* %11, null, !dbg !191
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !192

if.then6:                                         ; preds = %if.end
  call void @exit(i32 -1) #8, !dbg !193
  unreachable, !dbg !193

if.end7:                                          ; preds = %if.end
  %12 = load i8*, i8** %dest, align 8, !dbg !195
  %13 = bitcast i8* %12 to i32*, !dbg !195
  %14 = load i8*, i8** %data2, align 8, !dbg !196
  %15 = bitcast i8* %14 to i32*, !dbg !196
  %call8 = call i32* @wcscpy(i32* %13, i32* %15) #7, !dbg !197
  %16 = load i8*, i8** %dest, align 8, !dbg !198
  %17 = bitcast i8* %16 to i32*, !dbg !199
  call void @printWLine(i32* %17), !dbg !200
  %18 = load i8*, i8** %dest, align 8, !dbg !201
  call void @free(i8* %18) #7, !dbg !202
  ret void, !dbg !203
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_31.c", directory: "/root/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_31_bad", scope: !19, file: !19, line: 24, type: !20, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_31.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 26, type: !4)
!23 = !DILocation(line: 26, column: 12, scope: !18)
!24 = !DILocation(line: 27, column: 10, scope: !18)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !26, file: !19, line: 29, type: !5)
!26 = distinct !DILexicalBlock(scope: !18, file: !19, line: 28, column: 5)
!27 = !DILocation(line: 29, column: 19, scope: !26)
!28 = !DILocation(line: 29, column: 46, scope: !26)
!29 = !DILocation(line: 29, column: 35, scope: !26)
!30 = !DILocation(line: 30, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !26, file: !19, line: 30, column: 13)
!32 = !DILocation(line: 30, column: 27, scope: !31)
!33 = !DILocation(line: 30, column: 13, scope: !26)
!34 = !DILocation(line: 30, column: 37, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !19, line: 30, column: 36)
!36 = !DILocation(line: 31, column: 17, scope: !26)
!37 = !DILocation(line: 31, column: 9, scope: !26)
!38 = !DILocation(line: 32, column: 9, scope: !26)
!39 = !DILocation(line: 32, column: 29, scope: !26)
!40 = !DILocation(line: 34, column: 24, scope: !26)
!41 = !DILocation(line: 34, column: 16, scope: !26)
!42 = !DILocation(line: 34, column: 14, scope: !26)
!43 = !DILocalVariable(name: "dataCopy", scope: !44, file: !19, line: 37, type: !4)
!44 = distinct !DILexicalBlock(scope: !18, file: !19, line: 36, column: 5)
!45 = !DILocation(line: 37, column: 16, scope: !44)
!46 = !DILocation(line: 37, column: 27, scope: !44)
!47 = !DILocalVariable(name: "data", scope: !44, file: !19, line: 38, type: !4)
!48 = !DILocation(line: 38, column: 16, scope: !44)
!49 = !DILocation(line: 38, column: 23, scope: !44)
!50 = !DILocalVariable(name: "dataLen", scope: !51, file: !19, line: 41, type: !52)
!51 = distinct !DILexicalBlock(scope: !44, file: !19, line: 39, column: 9)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !53)
!53 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 41, column: 20, scope: !51)
!55 = !DILocation(line: 41, column: 45, scope: !51)
!56 = !DILocation(line: 41, column: 30, scope: !51)
!57 = !DILocalVariable(name: "dest", scope: !51, file: !19, line: 42, type: !4)
!58 = !DILocation(line: 42, column: 20, scope: !51)
!59 = !DILocation(line: 42, column: 42, scope: !51)
!60 = !DILocation(line: 42, column: 49, scope: !51)
!61 = !DILocation(line: 42, column: 35, scope: !51)
!62 = !DILocation(line: 43, column: 17, scope: !63)
!63 = distinct !DILexicalBlock(scope: !51, file: !19, line: 43, column: 17)
!64 = !DILocation(line: 43, column: 22, scope: !63)
!65 = !DILocation(line: 43, column: 17, scope: !51)
!66 = !DILocation(line: 43, column: 32, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !19, line: 43, column: 31)
!68 = !DILocation(line: 44, column: 26, scope: !51)
!69 = !DILocation(line: 44, column: 32, scope: !51)
!70 = !DILocation(line: 44, column: 19, scope: !51)
!71 = !DILocation(line: 45, column: 31, scope: !51)
!72 = !DILocation(line: 45, column: 13, scope: !51)
!73 = !DILocation(line: 46, column: 18, scope: !51)
!74 = !DILocation(line: 46, column: 13, scope: !51)
!75 = !DILocation(line: 49, column: 1, scope: !18)
!76 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_31_good", scope: !19, file: !19, line: 111, type: !20, scopeLine: 112, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 113, column: 5, scope: !76)
!78 = !DILocation(line: 114, column: 5, scope: !76)
!79 = !DILocation(line: 115, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 125, type: !81, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!8, !8, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !19, line: 125, type: !8)
!85 = !DILocation(line: 125, column: 14, scope: !80)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !19, line: 125, type: !83)
!87 = !DILocation(line: 125, column: 27, scope: !80)
!88 = !DILocation(line: 128, column: 22, scope: !80)
!89 = !DILocation(line: 128, column: 12, scope: !80)
!90 = !DILocation(line: 128, column: 5, scope: !80)
!91 = !DILocation(line: 130, column: 5, scope: !80)
!92 = !DILocation(line: 131, column: 5, scope: !80)
!93 = !DILocation(line: 132, column: 5, scope: !80)
!94 = !DILocation(line: 135, column: 5, scope: !80)
!95 = !DILocation(line: 136, column: 5, scope: !80)
!96 = !DILocation(line: 137, column: 5, scope: !80)
!97 = !DILocation(line: 139, column: 5, scope: !80)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 56, type: !20, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !19, line: 58, type: !4)
!100 = !DILocation(line: 58, column: 12, scope: !98)
!101 = !DILocation(line: 59, column: 10, scope: !98)
!102 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !19, line: 61, type: !9)
!103 = distinct !DILexicalBlock(scope: !98, file: !19, line: 60, column: 5)
!104 = !DILocation(line: 61, column: 16, scope: !103)
!105 = !DILocation(line: 61, column: 41, scope: !103)
!106 = !DILocation(line: 62, column: 13, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !19, line: 62, column: 13)
!108 = !DILocation(line: 62, column: 28, scope: !107)
!109 = !DILocation(line: 62, column: 13, scope: !103)
!110 = !DILocation(line: 62, column: 38, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !19, line: 62, column: 37)
!112 = !DILocation(line: 63, column: 16, scope: !103)
!113 = !DILocation(line: 63, column: 9, scope: !103)
!114 = !DILocation(line: 64, column: 9, scope: !103)
!115 = !DILocation(line: 64, column: 30, scope: !103)
!116 = !DILocation(line: 66, column: 24, scope: !103)
!117 = !DILocation(line: 66, column: 14, scope: !103)
!118 = !DILocalVariable(name: "dataCopy", scope: !119, file: !19, line: 69, type: !4)
!119 = distinct !DILexicalBlock(scope: !98, file: !19, line: 68, column: 5)
!120 = !DILocation(line: 69, column: 16, scope: !119)
!121 = !DILocation(line: 69, column: 27, scope: !119)
!122 = !DILocalVariable(name: "data", scope: !119, file: !19, line: 70, type: !4)
!123 = !DILocation(line: 70, column: 16, scope: !119)
!124 = !DILocation(line: 70, column: 23, scope: !119)
!125 = !DILocalVariable(name: "dataLen", scope: !126, file: !19, line: 73, type: !52)
!126 = distinct !DILexicalBlock(scope: !119, file: !19, line: 71, column: 9)
!127 = !DILocation(line: 73, column: 20, scope: !126)
!128 = !DILocation(line: 73, column: 45, scope: !126)
!129 = !DILocation(line: 73, column: 30, scope: !126)
!130 = !DILocalVariable(name: "dest", scope: !126, file: !19, line: 74, type: !4)
!131 = !DILocation(line: 74, column: 20, scope: !126)
!132 = !DILocation(line: 74, column: 42, scope: !126)
!133 = !DILocation(line: 74, column: 49, scope: !126)
!134 = !DILocation(line: 74, column: 35, scope: !126)
!135 = !DILocation(line: 75, column: 17, scope: !136)
!136 = distinct !DILexicalBlock(scope: !126, file: !19, line: 75, column: 17)
!137 = !DILocation(line: 75, column: 22, scope: !136)
!138 = !DILocation(line: 75, column: 17, scope: !126)
!139 = !DILocation(line: 75, column: 32, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !19, line: 75, column: 31)
!141 = !DILocation(line: 76, column: 26, scope: !126)
!142 = !DILocation(line: 76, column: 32, scope: !126)
!143 = !DILocation(line: 76, column: 19, scope: !126)
!144 = !DILocation(line: 77, column: 31, scope: !126)
!145 = !DILocation(line: 77, column: 13, scope: !126)
!146 = !DILocation(line: 78, column: 18, scope: !126)
!147 = !DILocation(line: 78, column: 13, scope: !126)
!148 = !DILocation(line: 81, column: 1, scope: !98)
!149 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 84, type: !20, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!150 = !DILocalVariable(name: "data", scope: !149, file: !19, line: 86, type: !4)
!151 = !DILocation(line: 86, column: 12, scope: !149)
!152 = !DILocation(line: 87, column: 10, scope: !149)
!153 = !DILocalVariable(name: "dataBadBuffer", scope: !154, file: !19, line: 89, type: !5)
!154 = distinct !DILexicalBlock(scope: !149, file: !19, line: 88, column: 5)
!155 = !DILocation(line: 89, column: 19, scope: !154)
!156 = !DILocation(line: 89, column: 46, scope: !154)
!157 = !DILocation(line: 89, column: 35, scope: !154)
!158 = !DILocation(line: 90, column: 13, scope: !159)
!159 = distinct !DILexicalBlock(scope: !154, file: !19, line: 90, column: 13)
!160 = !DILocation(line: 90, column: 27, scope: !159)
!161 = !DILocation(line: 90, column: 13, scope: !154)
!162 = !DILocation(line: 90, column: 37, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !19, line: 90, column: 36)
!164 = !DILocation(line: 91, column: 17, scope: !154)
!165 = !DILocation(line: 91, column: 9, scope: !154)
!166 = !DILocation(line: 92, column: 9, scope: !154)
!167 = !DILocation(line: 92, column: 29, scope: !154)
!168 = !DILocation(line: 94, column: 24, scope: !154)
!169 = !DILocation(line: 94, column: 16, scope: !154)
!170 = !DILocation(line: 94, column: 14, scope: !154)
!171 = !DILocalVariable(name: "dataCopy", scope: !172, file: !19, line: 97, type: !4)
!172 = distinct !DILexicalBlock(scope: !149, file: !19, line: 96, column: 5)
!173 = !DILocation(line: 97, column: 16, scope: !172)
!174 = !DILocation(line: 97, column: 27, scope: !172)
!175 = !DILocalVariable(name: "data", scope: !172, file: !19, line: 98, type: !4)
!176 = !DILocation(line: 98, column: 16, scope: !172)
!177 = !DILocation(line: 98, column: 23, scope: !172)
!178 = !DILocalVariable(name: "dataLen", scope: !179, file: !19, line: 101, type: !52)
!179 = distinct !DILexicalBlock(scope: !172, file: !19, line: 99, column: 9)
!180 = !DILocation(line: 101, column: 20, scope: !179)
!181 = !DILocation(line: 101, column: 48, scope: !179)
!182 = !DILocation(line: 101, column: 37, scope: !179)
!183 = !DILocation(line: 101, column: 30, scope: !179)
!184 = !DILocalVariable(name: "dest", scope: !179, file: !19, line: 102, type: !4)
!185 = !DILocation(line: 102, column: 20, scope: !179)
!186 = !DILocation(line: 102, column: 42, scope: !179)
!187 = !DILocation(line: 102, column: 49, scope: !179)
!188 = !DILocation(line: 102, column: 35, scope: !179)
!189 = !DILocation(line: 103, column: 17, scope: !190)
!190 = distinct !DILexicalBlock(scope: !179, file: !19, line: 103, column: 17)
!191 = !DILocation(line: 103, column: 22, scope: !190)
!192 = !DILocation(line: 103, column: 17, scope: !179)
!193 = !DILocation(line: 103, column: 32, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !19, line: 103, column: 31)
!195 = !DILocation(line: 104, column: 26, scope: !179)
!196 = !DILocation(line: 104, column: 32, scope: !179)
!197 = !DILocation(line: 104, column: 19, scope: !179)
!198 = !DILocation(line: 105, column: 35, scope: !179)
!199 = !DILocation(line: 105, column: 24, scope: !179)
!200 = !DILocation(line: 105, column: 13, scope: !179)
!201 = !DILocation(line: 106, column: 18, scope: !179)
!202 = !DILocation(line: 106, column: 13, scope: !179)
!203 = !DILocation(line: 109, column: 1, scope: !149)
