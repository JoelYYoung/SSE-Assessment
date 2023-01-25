; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__CWE135_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__CWE135_45_goodG2BData = internal global i8* null, align 8, !dbg !15
@CWE122_Heap_Based_Buffer_Overflow__CWE135_45_goodB2GData = internal global i8* null, align 8, !dbg !18

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_45_bad() #0 !dbg !26 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !29, metadata !DIExpression()), !dbg !30
  store i8* null, i8** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !32, metadata !DIExpression()), !dbg !34
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !35
  %0 = bitcast i8* %call to i32*, !dbg !36
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !34
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !37
  %cmp = icmp eq i32* %1, null, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !41
  unreachable, !dbg !41

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !43
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !44
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !45
  store i32 0, i32* %arrayidx, align 4, !dbg !46
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !47
  %5 = bitcast i32* %4 to i8*, !dbg !48
  store i8* %5, i8** %data, align 8, !dbg !49
  %6 = load i8*, i8** %data, align 8, !dbg !50
  store i8* %6, i8** @CWE122_Heap_Based_Buffer_Overflow__CWE135_45_badData, align 8, !dbg !51
  call void @badSink(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_45_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
  call void @goodB2G(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #7, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #7, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_45_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_45_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__CWE135_45_badData, align 8, !dbg !79
  store i8* %0, i8** %data, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !80, metadata !DIExpression()), !dbg !84
  %1 = load i8*, i8** %data, align 8, !dbg !85
  %call = call i64 @strlen(i8* %1) #9, !dbg !86
  store i64 %call, i64* %dataLen, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !87, metadata !DIExpression()), !dbg !88
  %2 = load i64, i64* %dataLen, align 8, !dbg !89
  %add = add i64 %2, 1, !dbg !90
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !91
  store i8* %call1, i8** %dest, align 8, !dbg !88
  %3 = load i8*, i8** %dest, align 8, !dbg !92
  %cmp = icmp eq i8* %3, null, !dbg !94
  br i1 %cmp, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %entry
  %4 = load i8*, i8** %dest, align 8, !dbg !98
  %5 = bitcast i8* %4 to i32*, !dbg !98
  %6 = load i8*, i8** %data, align 8, !dbg !99
  %7 = bitcast i8* %6 to i32*, !dbg !99
  %call2 = call i32* @wcscpy(i32* %5, i32* %7) #7, !dbg !100
  %8 = load i8*, i8** %dest, align 8, !dbg !101
  call void @printLine(i8* %8), !dbg !102
  %9 = load i8*, i8** %dest, align 8, !dbg !103
  call void @free(i8* %9) #7, !dbg !104
  ret void, !dbg !105
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @calloc(i64, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i8* null, i8** %data, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !112
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !113
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !112
  %0 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !114
  %cmp = icmp eq i8* %0, null, !dbg !116
  br i1 %cmp, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !121
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !122
  store i8 0, i8* %arrayidx, align 1, !dbg !123
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !124
  store i8* %3, i8** %data, align 8, !dbg !125
  %4 = load i8*, i8** %data, align 8, !dbg !126
  store i8* %4, i8** @CWE122_Heap_Based_Buffer_Overflow__CWE135_45_goodG2BData, align 8, !dbg !127
  call void @goodG2BSink(), !dbg !128
  ret void, !dbg !129
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !130 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !131, metadata !DIExpression()), !dbg !132
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__CWE135_45_goodG2BData, align 8, !dbg !133
  store i8* %0, i8** %data, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !134, metadata !DIExpression()), !dbg !136
  %1 = load i8*, i8** %data, align 8, !dbg !137
  %call = call i64 @strlen(i8* %1) #9, !dbg !138
  store i64 %call, i64* %dataLen, align 8, !dbg !136
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !139, metadata !DIExpression()), !dbg !140
  %2 = load i64, i64* %dataLen, align 8, !dbg !141
  %add = add i64 %2, 1, !dbg !142
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !143
  store i8* %call1, i8** %dest, align 8, !dbg !140
  %3 = load i8*, i8** %dest, align 8, !dbg !144
  %cmp = icmp eq i8* %3, null, !dbg !146
  br i1 %cmp, label %if.then, label %if.end, !dbg !147

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !148
  unreachable, !dbg !148

if.end:                                           ; preds = %entry
  %4 = load i8*, i8** %dest, align 8, !dbg !150
  %5 = load i8*, i8** %data, align 8, !dbg !151
  %call2 = call i8* @strcpy(i8* %4, i8* %5) #7, !dbg !152
  %6 = load i8*, i8** %dest, align 8, !dbg !153
  call void @printLine(i8* %6), !dbg !154
  %7 = load i8*, i8** %dest, align 8, !dbg !155
  call void @free(i8* %7) #7, !dbg !156
  ret void, !dbg !157
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !158 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !159, metadata !DIExpression()), !dbg !160
  store i8* null, i8** %data, align 8, !dbg !161
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !162, metadata !DIExpression()), !dbg !164
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !165
  %0 = bitcast i8* %call to i32*, !dbg !166
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !164
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !167
  %cmp = icmp eq i32* %1, null, !dbg !169
  br i1 %cmp, label %if.then, label %if.end, !dbg !170

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !171
  unreachable, !dbg !171

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !173
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !174
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !175
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !175
  store i32 0, i32* %arrayidx, align 4, !dbg !176
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !177
  %5 = bitcast i32* %4 to i8*, !dbg !178
  store i8* %5, i8** %data, align 8, !dbg !179
  %6 = load i8*, i8** %data, align 8, !dbg !180
  store i8* %6, i8** @CWE122_Heap_Based_Buffer_Overflow__CWE135_45_goodB2GData, align 8, !dbg !181
  call void @goodB2GSink(), !dbg !182
  ret void, !dbg !183
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink() #0 !dbg !184 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !185, metadata !DIExpression()), !dbg !186
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__CWE135_45_goodB2GData, align 8, !dbg !187
  store i8* %0, i8** %data, align 8, !dbg !186
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !188, metadata !DIExpression()), !dbg !190
  %1 = load i8*, i8** %data, align 8, !dbg !191
  %2 = bitcast i8* %1 to i32*, !dbg !192
  %call = call i64 @wcslen(i32* %2) #9, !dbg !193
  store i64 %call, i64* %dataLen, align 8, !dbg !190
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !194, metadata !DIExpression()), !dbg !195
  %3 = load i64, i64* %dataLen, align 8, !dbg !196
  %add = add i64 %3, 1, !dbg !197
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !198
  store i8* %call1, i8** %dest, align 8, !dbg !195
  %4 = load i8*, i8** %dest, align 8, !dbg !199
  %cmp = icmp eq i8* %4, null, !dbg !201
  br i1 %cmp, label %if.then, label %if.end, !dbg !202

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !203
  unreachable, !dbg !203

if.end:                                           ; preds = %entry
  %5 = load i8*, i8** %dest, align 8, !dbg !205
  %6 = bitcast i8* %5 to i32*, !dbg !205
  %7 = load i8*, i8** %data, align 8, !dbg !206
  %8 = bitcast i8* %7 to i32*, !dbg !206
  %call2 = call i32* @wcscpy(i32* %6, i32* %8) #7, !dbg !207
  %9 = load i8*, i8** %dest, align 8, !dbg !208
  %10 = bitcast i8* %9 to i32*, !dbg !209
  call void @printWLine(i32* %10), !dbg !210
  %11 = load i8*, i8** %dest, align 8, !dbg !211
  call void @free(i8* %11) #7, !dbg !212
  ret void, !dbg !213
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!20, !21, !22, !23, !24}
!llvm.ident = !{!25}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_45_badData", scope: !2, file: !17, line: 22, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !11, !12}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !9, line: 74, baseType: !10)
!9 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !{!0, !15, !18}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_45_goodG2BData", scope: !2, file: !17, line: 23, type: !6, isLocal: true, isDefinition: true)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_45.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_45_goodB2GData", scope: !2, file: !17, line: 24, type: !6, isLocal: true, isDefinition: true)
!20 = !{i32 7, !"Dwarf Version", i32 4}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{i32 7, !"uwtable", i32 1}
!24 = !{i32 7, !"frame-pointer", i32 2}
!25 = !{!"clang version 13.0.0"}
!26 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_45_bad", scope: !17, file: !17, line: 42, type: !27, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!27 = !DISubroutineType(types: !28)
!28 = !{null}
!29 = !DILocalVariable(name: "data", scope: !26, file: !17, line: 44, type: !6)
!30 = !DILocation(line: 44, column: 12, scope: !26)
!31 = !DILocation(line: 45, column: 10, scope: !26)
!32 = !DILocalVariable(name: "dataBadBuffer", scope: !33, file: !17, line: 47, type: !7)
!33 = distinct !DILexicalBlock(scope: !26, file: !17, line: 46, column: 5)
!34 = !DILocation(line: 47, column: 19, scope: !33)
!35 = !DILocation(line: 47, column: 46, scope: !33)
!36 = !DILocation(line: 47, column: 35, scope: !33)
!37 = !DILocation(line: 48, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !33, file: !17, line: 48, column: 13)
!39 = !DILocation(line: 48, column: 27, scope: !38)
!40 = !DILocation(line: 48, column: 13, scope: !33)
!41 = !DILocation(line: 48, column: 37, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !17, line: 48, column: 36)
!43 = !DILocation(line: 49, column: 17, scope: !33)
!44 = !DILocation(line: 49, column: 9, scope: !33)
!45 = !DILocation(line: 50, column: 9, scope: !33)
!46 = !DILocation(line: 50, column: 29, scope: !33)
!47 = !DILocation(line: 52, column: 24, scope: !33)
!48 = !DILocation(line: 52, column: 16, scope: !33)
!49 = !DILocation(line: 52, column: 14, scope: !33)
!50 = !DILocation(line: 54, column: 60, scope: !26)
!51 = !DILocation(line: 54, column: 58, scope: !26)
!52 = !DILocation(line: 55, column: 5, scope: !26)
!53 = !DILocation(line: 56, column: 1, scope: !26)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_45_good", scope: !17, file: !17, line: 124, type: !27, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DILocation(line: 126, column: 5, scope: !54)
!56 = !DILocation(line: 127, column: 5, scope: !54)
!57 = !DILocation(line: 128, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 138, type: !59, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DISubroutineType(types: !60)
!60 = !{!10, !10, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !17, line: 138, type: !10)
!63 = !DILocation(line: 138, column: 14, scope: !58)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !17, line: 138, type: !61)
!65 = !DILocation(line: 138, column: 27, scope: !58)
!66 = !DILocation(line: 141, column: 22, scope: !58)
!67 = !DILocation(line: 141, column: 12, scope: !58)
!68 = !DILocation(line: 141, column: 5, scope: !58)
!69 = !DILocation(line: 143, column: 5, scope: !58)
!70 = !DILocation(line: 144, column: 5, scope: !58)
!71 = !DILocation(line: 145, column: 5, scope: !58)
!72 = !DILocation(line: 148, column: 5, scope: !58)
!73 = !DILocation(line: 149, column: 5, scope: !58)
!74 = !DILocation(line: 150, column: 5, scope: !58)
!75 = !DILocation(line: 152, column: 5, scope: !58)
!76 = distinct !DISubprogram(name: "badSink", scope: !17, file: !17, line: 28, type: !27, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocalVariable(name: "data", scope: !76, file: !17, line: 30, type: !6)
!78 = !DILocation(line: 30, column: 12, scope: !76)
!79 = !DILocation(line: 30, column: 19, scope: !76)
!80 = !DILocalVariable(name: "dataLen", scope: !81, file: !17, line: 33, type: !82)
!81 = distinct !DILexicalBlock(scope: !76, file: !17, line: 31, column: 5)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !9, line: 46, baseType: !83)
!83 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!84 = !DILocation(line: 33, column: 16, scope: !81)
!85 = !DILocation(line: 33, column: 41, scope: !81)
!86 = !DILocation(line: 33, column: 26, scope: !81)
!87 = !DILocalVariable(name: "dest", scope: !81, file: !17, line: 34, type: !6)
!88 = !DILocation(line: 34, column: 16, scope: !81)
!89 = !DILocation(line: 34, column: 38, scope: !81)
!90 = !DILocation(line: 34, column: 45, scope: !81)
!91 = !DILocation(line: 34, column: 31, scope: !81)
!92 = !DILocation(line: 35, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !81, file: !17, line: 35, column: 13)
!94 = !DILocation(line: 35, column: 18, scope: !93)
!95 = !DILocation(line: 35, column: 13, scope: !81)
!96 = !DILocation(line: 35, column: 28, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !17, line: 35, column: 27)
!98 = !DILocation(line: 36, column: 22, scope: !81)
!99 = !DILocation(line: 36, column: 28, scope: !81)
!100 = !DILocation(line: 36, column: 15, scope: !81)
!101 = !DILocation(line: 37, column: 27, scope: !81)
!102 = !DILocation(line: 37, column: 9, scope: !81)
!103 = !DILocation(line: 38, column: 14, scope: !81)
!104 = !DILocation(line: 38, column: 9, scope: !81)
!105 = !DILocation(line: 40, column: 1, scope: !76)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 77, type: !27, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocalVariable(name: "data", scope: !106, file: !17, line: 79, type: !6)
!108 = !DILocation(line: 79, column: 12, scope: !106)
!109 = !DILocation(line: 80, column: 10, scope: !106)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !111, file: !17, line: 82, type: !12)
!111 = distinct !DILexicalBlock(scope: !106, file: !17, line: 81, column: 5)
!112 = !DILocation(line: 82, column: 16, scope: !111)
!113 = !DILocation(line: 82, column: 41, scope: !111)
!114 = !DILocation(line: 83, column: 13, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !17, line: 83, column: 13)
!116 = !DILocation(line: 83, column: 28, scope: !115)
!117 = !DILocation(line: 83, column: 13, scope: !111)
!118 = !DILocation(line: 83, column: 38, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !17, line: 83, column: 37)
!120 = !DILocation(line: 84, column: 16, scope: !111)
!121 = !DILocation(line: 84, column: 9, scope: !111)
!122 = !DILocation(line: 85, column: 9, scope: !111)
!123 = !DILocation(line: 85, column: 30, scope: !111)
!124 = !DILocation(line: 87, column: 24, scope: !111)
!125 = !DILocation(line: 87, column: 14, scope: !111)
!126 = !DILocation(line: 89, column: 64, scope: !106)
!127 = !DILocation(line: 89, column: 62, scope: !106)
!128 = !DILocation(line: 90, column: 5, scope: !106)
!129 = !DILocation(line: 91, column: 1, scope: !106)
!130 = distinct !DISubprogram(name: "goodG2BSink", scope: !17, file: !17, line: 63, type: !27, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!131 = !DILocalVariable(name: "data", scope: !130, file: !17, line: 65, type: !6)
!132 = !DILocation(line: 65, column: 12, scope: !130)
!133 = !DILocation(line: 65, column: 19, scope: !130)
!134 = !DILocalVariable(name: "dataLen", scope: !135, file: !17, line: 68, type: !82)
!135 = distinct !DILexicalBlock(scope: !130, file: !17, line: 66, column: 5)
!136 = !DILocation(line: 68, column: 16, scope: !135)
!137 = !DILocation(line: 68, column: 41, scope: !135)
!138 = !DILocation(line: 68, column: 26, scope: !135)
!139 = !DILocalVariable(name: "dest", scope: !135, file: !17, line: 69, type: !6)
!140 = !DILocation(line: 69, column: 16, scope: !135)
!141 = !DILocation(line: 69, column: 38, scope: !135)
!142 = !DILocation(line: 69, column: 45, scope: !135)
!143 = !DILocation(line: 69, column: 31, scope: !135)
!144 = !DILocation(line: 70, column: 13, scope: !145)
!145 = distinct !DILexicalBlock(scope: !135, file: !17, line: 70, column: 13)
!146 = !DILocation(line: 70, column: 18, scope: !145)
!147 = !DILocation(line: 70, column: 13, scope: !135)
!148 = !DILocation(line: 70, column: 28, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !17, line: 70, column: 27)
!150 = !DILocation(line: 71, column: 22, scope: !135)
!151 = !DILocation(line: 71, column: 28, scope: !135)
!152 = !DILocation(line: 71, column: 15, scope: !135)
!153 = !DILocation(line: 72, column: 27, scope: !135)
!154 = !DILocation(line: 72, column: 9, scope: !135)
!155 = !DILocation(line: 73, column: 14, scope: !135)
!156 = !DILocation(line: 73, column: 9, scope: !135)
!157 = !DILocation(line: 75, column: 1, scope: !130)
!158 = distinct !DISubprogram(name: "goodB2G", scope: !17, file: !17, line: 108, type: !27, scopeLine: 109, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!159 = !DILocalVariable(name: "data", scope: !158, file: !17, line: 110, type: !6)
!160 = !DILocation(line: 110, column: 12, scope: !158)
!161 = !DILocation(line: 111, column: 10, scope: !158)
!162 = !DILocalVariable(name: "dataBadBuffer", scope: !163, file: !17, line: 113, type: !7)
!163 = distinct !DILexicalBlock(scope: !158, file: !17, line: 112, column: 5)
!164 = !DILocation(line: 113, column: 19, scope: !163)
!165 = !DILocation(line: 113, column: 46, scope: !163)
!166 = !DILocation(line: 113, column: 35, scope: !163)
!167 = !DILocation(line: 114, column: 13, scope: !168)
!168 = distinct !DILexicalBlock(scope: !163, file: !17, line: 114, column: 13)
!169 = !DILocation(line: 114, column: 27, scope: !168)
!170 = !DILocation(line: 114, column: 13, scope: !163)
!171 = !DILocation(line: 114, column: 37, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !17, line: 114, column: 36)
!173 = !DILocation(line: 115, column: 17, scope: !163)
!174 = !DILocation(line: 115, column: 9, scope: !163)
!175 = !DILocation(line: 116, column: 9, scope: !163)
!176 = !DILocation(line: 116, column: 29, scope: !163)
!177 = !DILocation(line: 118, column: 24, scope: !163)
!178 = !DILocation(line: 118, column: 16, scope: !163)
!179 = !DILocation(line: 118, column: 14, scope: !163)
!180 = !DILocation(line: 120, column: 64, scope: !158)
!181 = !DILocation(line: 120, column: 62, scope: !158)
!182 = !DILocation(line: 121, column: 5, scope: !158)
!183 = !DILocation(line: 122, column: 1, scope: !158)
!184 = distinct !DISubprogram(name: "goodB2GSink", scope: !17, file: !17, line: 94, type: !27, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!185 = !DILocalVariable(name: "data", scope: !184, file: !17, line: 96, type: !6)
!186 = !DILocation(line: 96, column: 12, scope: !184)
!187 = !DILocation(line: 96, column: 19, scope: !184)
!188 = !DILocalVariable(name: "dataLen", scope: !189, file: !17, line: 99, type: !82)
!189 = distinct !DILexicalBlock(scope: !184, file: !17, line: 97, column: 5)
!190 = !DILocation(line: 99, column: 16, scope: !189)
!191 = !DILocation(line: 99, column: 44, scope: !189)
!192 = !DILocation(line: 99, column: 33, scope: !189)
!193 = !DILocation(line: 99, column: 26, scope: !189)
!194 = !DILocalVariable(name: "dest", scope: !189, file: !17, line: 100, type: !6)
!195 = !DILocation(line: 100, column: 16, scope: !189)
!196 = !DILocation(line: 100, column: 38, scope: !189)
!197 = !DILocation(line: 100, column: 45, scope: !189)
!198 = !DILocation(line: 100, column: 31, scope: !189)
!199 = !DILocation(line: 101, column: 13, scope: !200)
!200 = distinct !DILexicalBlock(scope: !189, file: !17, line: 101, column: 13)
!201 = !DILocation(line: 101, column: 18, scope: !200)
!202 = !DILocation(line: 101, column: 13, scope: !189)
!203 = !DILocation(line: 101, column: 28, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !17, line: 101, column: 27)
!205 = !DILocation(line: 102, column: 22, scope: !189)
!206 = !DILocation(line: 102, column: 28, scope: !189)
!207 = !DILocation(line: 102, column: 15, scope: !189)
!208 = !DILocation(line: 103, column: 31, scope: !189)
!209 = !DILocation(line: 103, column: 20, scope: !189)
!210 = !DILocation(line: 103, column: 9, scope: !189)
!211 = !DILocation(line: 104, column: 14, scope: !189)
!212 = !DILocation(line: 104, column: 9, scope: !189)
!213 = !DILocation(line: 106, column: 1, scope: !184)
