; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_44_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !24, metadata !DIExpression()), !dbg !28
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !28
  store i8* null, i8** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !30, metadata !DIExpression()), !dbg !32
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !33
  %0 = bitcast i8* %call to i32*, !dbg !34
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !32
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !35
  %cmp = icmp eq i32* %1, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !41
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !42
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !45
  %5 = bitcast i32* %4 to i8*, !dbg !46
  store i8* %5, i8** %data, align 8, !dbg !47
  %6 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !48
  %7 = load i8*, i8** %data, align 8, !dbg !49
  call void %6(i8* %7), !dbg !48
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !51 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !54, metadata !DIExpression()), !dbg !58
  %0 = load i8*, i8** %data.addr, align 8, !dbg !59
  %call = call i64 @strlen(i8* %0) #9, !dbg !60
  store i64 %call, i64* %dataLen, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !61, metadata !DIExpression()), !dbg !62
  %1 = load i64, i64* %dataLen, align 8, !dbg !63
  %add = add i64 %1, 1, !dbg !64
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !65
  store i8* %call1, i8** %dest, align 8, !dbg !62
  %2 = load i8*, i8** %dest, align 8, !dbg !66
  %cmp = icmp eq i8* %2, null, !dbg !68
  br i1 %cmp, label %if.then, label %if.end, !dbg !69

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !70
  unreachable, !dbg !70

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %dest, align 8, !dbg !72
  %4 = bitcast i8* %3 to i32*, !dbg !72
  %5 = load i8*, i8** %data.addr, align 8, !dbg !73
  %6 = bitcast i8* %5 to i32*, !dbg !73
  %call2 = call i32* @wcscpy(i32* %4, i32* %6) #7, !dbg !74
  %7 = load i8*, i8** %dest, align 8, !dbg !75
  call void @printLine(i8* %7), !dbg !76
  %8 = load i8*, i8** %dest, align 8, !dbg !77
  call void @free(i8* %8) #7, !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_44_good() #0 !dbg !80 {
entry:
  call void @goodG2B(), !dbg !81
  call void @goodB2G(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* null) #7, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 %conv) #7, !dbg !94
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_44_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_44_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @calloc(i64, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !102 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !105, metadata !DIExpression()), !dbg !106
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !106
  store i8* null, i8** %data, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !108, metadata !DIExpression()), !dbg !110
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !111
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !110
  %0 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !112
  %cmp = icmp eq i8* %0, null, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !116
  unreachable, !dbg !116

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !119
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !120
  store i8 0, i8* %arrayidx, align 1, !dbg !121
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !122
  store i8* %3, i8** %data, align 8, !dbg !123
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !124
  %5 = load i8*, i8** %data, align 8, !dbg !125
  call void %4(i8* %5), !dbg !124
  ret void, !dbg !126
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !127 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !130, metadata !DIExpression()), !dbg !132
  %0 = load i8*, i8** %data.addr, align 8, !dbg !133
  %call = call i64 @strlen(i8* %0) #9, !dbg !134
  store i64 %call, i64* %dataLen, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !135, metadata !DIExpression()), !dbg !136
  %1 = load i64, i64* %dataLen, align 8, !dbg !137
  %add = add i64 %1, 1, !dbg !138
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !139
  store i8* %call1, i8** %dest, align 8, !dbg !136
  %2 = load i8*, i8** %dest, align 8, !dbg !140
  %cmp = icmp eq i8* %2, null, !dbg !142
  br i1 %cmp, label %if.then, label %if.end, !dbg !143

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !144
  unreachable, !dbg !144

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %dest, align 8, !dbg !146
  %4 = load i8*, i8** %data.addr, align 8, !dbg !147
  %call2 = call i8* @strcpy(i8* %3, i8* %4) #7, !dbg !148
  %5 = load i8*, i8** %dest, align 8, !dbg !149
  call void @printLine(i8* %5), !dbg !150
  %6 = load i8*, i8** %dest, align 8, !dbg !151
  call void @free(i8* %6) #7, !dbg !152
  ret void, !dbg !153
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !154 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !155, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !157, metadata !DIExpression()), !dbg !158
  store void (i8*)* @goodB2GSink, void (i8*)** %funcPtr, align 8, !dbg !158
  store i8* null, i8** %data, align 8, !dbg !159
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !160, metadata !DIExpression()), !dbg !162
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !163
  %0 = bitcast i8* %call to i32*, !dbg !164
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !162
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !165
  %cmp = icmp eq i32* %1, null, !dbg !167
  br i1 %cmp, label %if.then, label %if.end, !dbg !168

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !169
  unreachable, !dbg !169

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !171
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !172
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !173
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !173
  store i32 0, i32* %arrayidx, align 4, !dbg !174
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !175
  %5 = bitcast i32* %4 to i8*, !dbg !176
  store i8* %5, i8** %data, align 8, !dbg !177
  %6 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !178
  %7 = load i8*, i8** %data, align 8, !dbg !179
  call void %6(i8* %7), !dbg !178
  ret void, !dbg !180
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i8* %data) #0 !dbg !181 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !182, metadata !DIExpression()), !dbg !183
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !184, metadata !DIExpression()), !dbg !186
  %0 = load i8*, i8** %data.addr, align 8, !dbg !187
  %1 = bitcast i8* %0 to i32*, !dbg !188
  %call = call i64 @wcslen(i32* %1) #9, !dbg !189
  store i64 %call, i64* %dataLen, align 8, !dbg !186
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !190, metadata !DIExpression()), !dbg !191
  %2 = load i64, i64* %dataLen, align 8, !dbg !192
  %add = add i64 %2, 1, !dbg !193
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !194
  store i8* %call1, i8** %dest, align 8, !dbg !191
  %3 = load i8*, i8** %dest, align 8, !dbg !195
  %cmp = icmp eq i8* %3, null, !dbg !197
  br i1 %cmp, label %if.then, label %if.end, !dbg !198

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !199
  unreachable, !dbg !199

if.end:                                           ; preds = %entry
  %4 = load i8*, i8** %dest, align 8, !dbg !201
  %5 = bitcast i8* %4 to i32*, !dbg !201
  %6 = load i8*, i8** %data.addr, align 8, !dbg !202
  %7 = bitcast i8* %6 to i32*, !dbg !202
  %call2 = call i32* @wcscpy(i32* %5, i32* %7) #7, !dbg !203
  %8 = load i8*, i8** %dest, align 8, !dbg !204
  %9 = bitcast i8* %8 to i32*, !dbg !205
  call void @printWLine(i32* %9), !dbg !206
  %10 = load i8*, i8** %dest, align 8, !dbg !207
  call void @free(i8* %10) #7, !dbg !208
  ret void, !dbg !209
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn writeonly }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9, !10}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_44_bad", scope: !19, file: !19, line: 37, type: !20, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_44.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 39, type: !4)
!23 = !DILocation(line: 39, column: 12, scope: !18)
!24 = !DILocalVariable(name: "funcPtr", scope: !18, file: !19, line: 41, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DISubroutineType(types: !27)
!27 = !{null, !4}
!28 = !DILocation(line: 41, column: 12, scope: !18)
!29 = !DILocation(line: 42, column: 10, scope: !18)
!30 = !DILocalVariable(name: "dataBadBuffer", scope: !31, file: !19, line: 44, type: !5)
!31 = distinct !DILexicalBlock(scope: !18, file: !19, line: 43, column: 5)
!32 = !DILocation(line: 44, column: 19, scope: !31)
!33 = !DILocation(line: 44, column: 46, scope: !31)
!34 = !DILocation(line: 44, column: 35, scope: !31)
!35 = !DILocation(line: 45, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !31, file: !19, line: 45, column: 13)
!37 = !DILocation(line: 45, column: 27, scope: !36)
!38 = !DILocation(line: 45, column: 13, scope: !31)
!39 = !DILocation(line: 45, column: 37, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !19, line: 45, column: 36)
!41 = !DILocation(line: 46, column: 17, scope: !31)
!42 = !DILocation(line: 46, column: 9, scope: !31)
!43 = !DILocation(line: 47, column: 9, scope: !31)
!44 = !DILocation(line: 47, column: 29, scope: !31)
!45 = !DILocation(line: 49, column: 24, scope: !31)
!46 = !DILocation(line: 49, column: 16, scope: !31)
!47 = !DILocation(line: 49, column: 14, scope: !31)
!48 = !DILocation(line: 52, column: 5, scope: !18)
!49 = !DILocation(line: 52, column: 13, scope: !18)
!50 = !DILocation(line: 53, column: 1, scope: !18)
!51 = distinct !DISubprogram(name: "badSink", scope: !19, file: !19, line: 24, type: !26, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocalVariable(name: "data", arg: 1, scope: !51, file: !19, line: 24, type: !4)
!53 = !DILocation(line: 24, column: 28, scope: !51)
!54 = !DILocalVariable(name: "dataLen", scope: !55, file: !19, line: 28, type: !56)
!55 = distinct !DILexicalBlock(scope: !51, file: !19, line: 26, column: 5)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !57)
!57 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!58 = !DILocation(line: 28, column: 16, scope: !55)
!59 = !DILocation(line: 28, column: 41, scope: !55)
!60 = !DILocation(line: 28, column: 26, scope: !55)
!61 = !DILocalVariable(name: "dest", scope: !55, file: !19, line: 29, type: !4)
!62 = !DILocation(line: 29, column: 16, scope: !55)
!63 = !DILocation(line: 29, column: 38, scope: !55)
!64 = !DILocation(line: 29, column: 45, scope: !55)
!65 = !DILocation(line: 29, column: 31, scope: !55)
!66 = !DILocation(line: 30, column: 13, scope: !67)
!67 = distinct !DILexicalBlock(scope: !55, file: !19, line: 30, column: 13)
!68 = !DILocation(line: 30, column: 18, scope: !67)
!69 = !DILocation(line: 30, column: 13, scope: !55)
!70 = !DILocation(line: 30, column: 28, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !19, line: 30, column: 27)
!72 = !DILocation(line: 31, column: 22, scope: !55)
!73 = !DILocation(line: 31, column: 28, scope: !55)
!74 = !DILocation(line: 31, column: 15, scope: !55)
!75 = !DILocation(line: 32, column: 27, scope: !55)
!76 = !DILocation(line: 32, column: 9, scope: !55)
!77 = !DILocation(line: 33, column: 14, scope: !55)
!78 = !DILocation(line: 33, column: 9, scope: !55)
!79 = !DILocation(line: 35, column: 1, scope: !51)
!80 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_44_good", scope: !19, file: !19, line: 119, type: !20, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 121, column: 5, scope: !80)
!82 = !DILocation(line: 122, column: 5, scope: !80)
!83 = !DILocation(line: 123, column: 1, scope: !80)
!84 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 133, type: !85, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!8, !8, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !19, line: 133, type: !8)
!89 = !DILocation(line: 133, column: 14, scope: !84)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !19, line: 133, type: !87)
!91 = !DILocation(line: 133, column: 27, scope: !84)
!92 = !DILocation(line: 136, column: 22, scope: !84)
!93 = !DILocation(line: 136, column: 12, scope: !84)
!94 = !DILocation(line: 136, column: 5, scope: !84)
!95 = !DILocation(line: 138, column: 5, scope: !84)
!96 = !DILocation(line: 139, column: 5, scope: !84)
!97 = !DILocation(line: 140, column: 5, scope: !84)
!98 = !DILocation(line: 143, column: 5, scope: !84)
!99 = !DILocation(line: 144, column: 5, scope: !84)
!100 = !DILocation(line: 145, column: 5, scope: !84)
!101 = !DILocation(line: 147, column: 5, scope: !84)
!102 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 73, type: !20, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !19, line: 75, type: !4)
!104 = !DILocation(line: 75, column: 12, scope: !102)
!105 = !DILocalVariable(name: "funcPtr", scope: !102, file: !19, line: 76, type: !25)
!106 = !DILocation(line: 76, column: 12, scope: !102)
!107 = !DILocation(line: 77, column: 10, scope: !102)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !109, file: !19, line: 79, type: !10)
!109 = distinct !DILexicalBlock(scope: !102, file: !19, line: 78, column: 5)
!110 = !DILocation(line: 79, column: 16, scope: !109)
!111 = !DILocation(line: 79, column: 41, scope: !109)
!112 = !DILocation(line: 80, column: 13, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !19, line: 80, column: 13)
!114 = !DILocation(line: 80, column: 28, scope: !113)
!115 = !DILocation(line: 80, column: 13, scope: !109)
!116 = !DILocation(line: 80, column: 38, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !19, line: 80, column: 37)
!118 = !DILocation(line: 81, column: 16, scope: !109)
!119 = !DILocation(line: 81, column: 9, scope: !109)
!120 = !DILocation(line: 82, column: 9, scope: !109)
!121 = !DILocation(line: 82, column: 30, scope: !109)
!122 = !DILocation(line: 84, column: 24, scope: !109)
!123 = !DILocation(line: 84, column: 14, scope: !109)
!124 = !DILocation(line: 86, column: 5, scope: !102)
!125 = !DILocation(line: 86, column: 13, scope: !102)
!126 = !DILocation(line: 87, column: 1, scope: !102)
!127 = distinct !DISubprogram(name: "goodG2BSink", scope: !19, file: !19, line: 60, type: !26, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!128 = !DILocalVariable(name: "data", arg: 1, scope: !127, file: !19, line: 60, type: !4)
!129 = !DILocation(line: 60, column: 32, scope: !127)
!130 = !DILocalVariable(name: "dataLen", scope: !131, file: !19, line: 64, type: !56)
!131 = distinct !DILexicalBlock(scope: !127, file: !19, line: 62, column: 5)
!132 = !DILocation(line: 64, column: 16, scope: !131)
!133 = !DILocation(line: 64, column: 41, scope: !131)
!134 = !DILocation(line: 64, column: 26, scope: !131)
!135 = !DILocalVariable(name: "dest", scope: !131, file: !19, line: 65, type: !4)
!136 = !DILocation(line: 65, column: 16, scope: !131)
!137 = !DILocation(line: 65, column: 38, scope: !131)
!138 = !DILocation(line: 65, column: 45, scope: !131)
!139 = !DILocation(line: 65, column: 31, scope: !131)
!140 = !DILocation(line: 66, column: 13, scope: !141)
!141 = distinct !DILexicalBlock(scope: !131, file: !19, line: 66, column: 13)
!142 = !DILocation(line: 66, column: 18, scope: !141)
!143 = !DILocation(line: 66, column: 13, scope: !131)
!144 = !DILocation(line: 66, column: 28, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !19, line: 66, column: 27)
!146 = !DILocation(line: 67, column: 22, scope: !131)
!147 = !DILocation(line: 67, column: 28, scope: !131)
!148 = !DILocation(line: 67, column: 15, scope: !131)
!149 = !DILocation(line: 68, column: 27, scope: !131)
!150 = !DILocation(line: 68, column: 9, scope: !131)
!151 = !DILocation(line: 69, column: 14, scope: !131)
!152 = !DILocation(line: 69, column: 9, scope: !131)
!153 = !DILocation(line: 71, column: 1, scope: !127)
!154 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 103, type: !20, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!155 = !DILocalVariable(name: "data", scope: !154, file: !19, line: 105, type: !4)
!156 = !DILocation(line: 105, column: 12, scope: !154)
!157 = !DILocalVariable(name: "funcPtr", scope: !154, file: !19, line: 106, type: !25)
!158 = !DILocation(line: 106, column: 12, scope: !154)
!159 = !DILocation(line: 107, column: 10, scope: !154)
!160 = !DILocalVariable(name: "dataBadBuffer", scope: !161, file: !19, line: 109, type: !5)
!161 = distinct !DILexicalBlock(scope: !154, file: !19, line: 108, column: 5)
!162 = !DILocation(line: 109, column: 19, scope: !161)
!163 = !DILocation(line: 109, column: 46, scope: !161)
!164 = !DILocation(line: 109, column: 35, scope: !161)
!165 = !DILocation(line: 110, column: 13, scope: !166)
!166 = distinct !DILexicalBlock(scope: !161, file: !19, line: 110, column: 13)
!167 = !DILocation(line: 110, column: 27, scope: !166)
!168 = !DILocation(line: 110, column: 13, scope: !161)
!169 = !DILocation(line: 110, column: 37, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !19, line: 110, column: 36)
!171 = !DILocation(line: 111, column: 17, scope: !161)
!172 = !DILocation(line: 111, column: 9, scope: !161)
!173 = !DILocation(line: 112, column: 9, scope: !161)
!174 = !DILocation(line: 112, column: 29, scope: !161)
!175 = !DILocation(line: 114, column: 24, scope: !161)
!176 = !DILocation(line: 114, column: 16, scope: !161)
!177 = !DILocation(line: 114, column: 14, scope: !161)
!178 = !DILocation(line: 116, column: 5, scope: !154)
!179 = !DILocation(line: 116, column: 13, scope: !154)
!180 = !DILocation(line: 117, column: 1, scope: !154)
!181 = distinct !DISubprogram(name: "goodB2GSink", scope: !19, file: !19, line: 90, type: !26, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!182 = !DILocalVariable(name: "data", arg: 1, scope: !181, file: !19, line: 90, type: !4)
!183 = !DILocation(line: 90, column: 32, scope: !181)
!184 = !DILocalVariable(name: "dataLen", scope: !185, file: !19, line: 94, type: !56)
!185 = distinct !DILexicalBlock(scope: !181, file: !19, line: 92, column: 5)
!186 = !DILocation(line: 94, column: 16, scope: !185)
!187 = !DILocation(line: 94, column: 44, scope: !185)
!188 = !DILocation(line: 94, column: 33, scope: !185)
!189 = !DILocation(line: 94, column: 26, scope: !185)
!190 = !DILocalVariable(name: "dest", scope: !185, file: !19, line: 95, type: !4)
!191 = !DILocation(line: 95, column: 16, scope: !185)
!192 = !DILocation(line: 95, column: 38, scope: !185)
!193 = !DILocation(line: 95, column: 45, scope: !185)
!194 = !DILocation(line: 95, column: 31, scope: !185)
!195 = !DILocation(line: 96, column: 13, scope: !196)
!196 = distinct !DILexicalBlock(scope: !185, file: !19, line: 96, column: 13)
!197 = !DILocation(line: 96, column: 18, scope: !196)
!198 = !DILocation(line: 96, column: 13, scope: !185)
!199 = !DILocation(line: 96, column: 28, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !19, line: 96, column: 27)
!201 = !DILocation(line: 97, column: 22, scope: !185)
!202 = !DILocation(line: 97, column: 28, scope: !185)
!203 = !DILocation(line: 97, column: 15, scope: !185)
!204 = !DILocation(line: 98, column: 31, scope: !185)
!205 = !DILocation(line: 98, column: 20, scope: !185)
!206 = !DILocation(line: 98, column: 9, scope: !185)
!207 = !DILocation(line: 99, column: 14, scope: !185)
!208 = !DILocation(line: 99, column: 9, scope: !185)
!209 = !DILocation(line: 101, column: 1, scope: !181)
