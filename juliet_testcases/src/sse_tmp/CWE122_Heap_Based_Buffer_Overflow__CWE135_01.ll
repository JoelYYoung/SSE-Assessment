; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_01_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
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
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !43, metadata !DIExpression()), !dbg !47
  %6 = load i8*, i8** %data, align 8, !dbg !48
  %call2 = call i64 @strlen(i8* %6) #9, !dbg !49
  store i64 %call2, i64* %dataLen, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !50, metadata !DIExpression()), !dbg !51
  %7 = load i64, i64* %dataLen, align 8, !dbg !52
  %add = add i64 %7, 1, !dbg !53
  %call3 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !54
  store i8* %call3, i8** %dest, align 8, !dbg !51
  %8 = load i8*, i8** %dest, align 8, !dbg !55
  %cmp4 = icmp eq i8* %8, null, !dbg !57
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !58

if.then5:                                         ; preds = %if.end
  call void @exit(i32 -1) #8, !dbg !59
  unreachable, !dbg !59

if.end6:                                          ; preds = %if.end
  %9 = load i8*, i8** %dest, align 8, !dbg !61
  %10 = bitcast i8* %9 to i32*, !dbg !61
  %11 = load i8*, i8** %data, align 8, !dbg !62
  %12 = bitcast i8* %11 to i32*, !dbg !62
  %call7 = call i32* @wcscpy(i32* %10, i32* %12) #7, !dbg !63
  %13 = load i8*, i8** %dest, align 8, !dbg !64
  call void @printLine(i8* %13), !dbg !65
  %14 = load i8*, i8** %dest, align 8, !dbg !66
  call void @free(i8* %14) #7, !dbg !67
  ret void, !dbg !68
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_01_good() #0 !dbg !69 {
entry:
  call void @goodG2B(), !dbg !70
  call void @goodB2G(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #7, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #7, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_01_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE135_01_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !91 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !92, metadata !DIExpression()), !dbg !93
  store i8* null, i8** %data, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !95, metadata !DIExpression()), !dbg !97
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !98
  store i8* %call, i8** %dataGoodBuffer, align 8, !dbg !97
  %0 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !99
  %cmp = icmp eq i8* %0, null, !dbg !101
  br i1 %cmp, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !106
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !109
  store i8* %3, i8** %data, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !111, metadata !DIExpression()), !dbg !113
  %4 = load i8*, i8** %data, align 8, !dbg !114
  %call1 = call i64 @strlen(i8* %4) #9, !dbg !115
  store i64 %call1, i64* %dataLen, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !116, metadata !DIExpression()), !dbg !117
  %5 = load i64, i64* %dataLen, align 8, !dbg !118
  %add = add i64 %5, 1, !dbg !119
  %call2 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !120
  store i8* %call2, i8** %dest, align 8, !dbg !117
  %6 = load i8*, i8** %dest, align 8, !dbg !121
  %cmp3 = icmp eq i8* %6, null, !dbg !123
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !124

if.then4:                                         ; preds = %if.end
  call void @exit(i32 -1) #8, !dbg !125
  unreachable, !dbg !125

if.end5:                                          ; preds = %if.end
  %7 = load i8*, i8** %dest, align 8, !dbg !127
  %8 = load i8*, i8** %data, align 8, !dbg !128
  %call6 = call i8* @strcpy(i8* %7, i8* %8) #7, !dbg !129
  %9 = load i8*, i8** %dest, align 8, !dbg !130
  call void @printLine(i8* %9), !dbg !131
  %10 = load i8*, i8** %dest, align 8, !dbg !132
  call void @free(i8* %10) #7, !dbg !133
  ret void, !dbg !134
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !135 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !136, metadata !DIExpression()), !dbg !137
  store i8* null, i8** %data, align 8, !dbg !138
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !139, metadata !DIExpression()), !dbg !141
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !142
  %0 = bitcast i8* %call to i32*, !dbg !143
  store i32* %0, i32** %dataBadBuffer, align 8, !dbg !141
  %1 = load i32*, i32** %dataBadBuffer, align 8, !dbg !144
  %cmp = icmp eq i32* %1, null, !dbg !146
  br i1 %cmp, label %if.then, label %if.end, !dbg !147

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !148
  unreachable, !dbg !148

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !150
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !151
  %3 = load i32*, i32** %dataBadBuffer, align 8, !dbg !152
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !152
  store i32 0, i32* %arrayidx, align 4, !dbg !153
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !154
  %5 = bitcast i32* %4 to i8*, !dbg !155
  store i8* %5, i8** %data, align 8, !dbg !156
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !157, metadata !DIExpression()), !dbg !159
  %6 = load i8*, i8** %data, align 8, !dbg !160
  %7 = bitcast i8* %6 to i32*, !dbg !161
  %call2 = call i64 @wcslen(i32* %7) #9, !dbg !162
  store i64 %call2, i64* %dataLen, align 8, !dbg !159
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !163, metadata !DIExpression()), !dbg !164
  %8 = load i64, i64* %dataLen, align 8, !dbg !165
  %add = add i64 %8, 1, !dbg !166
  %call3 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !167
  store i8* %call3, i8** %dest, align 8, !dbg !164
  %9 = load i8*, i8** %dest, align 8, !dbg !168
  %cmp4 = icmp eq i8* %9, null, !dbg !170
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !171

if.then5:                                         ; preds = %if.end
  call void @exit(i32 -1) #8, !dbg !172
  unreachable, !dbg !172

if.end6:                                          ; preds = %if.end
  %10 = load i8*, i8** %dest, align 8, !dbg !174
  %11 = bitcast i8* %10 to i32*, !dbg !174
  %12 = load i8*, i8** %data, align 8, !dbg !175
  %13 = bitcast i8* %12 to i32*, !dbg !175
  %call7 = call i32* @wcscpy(i32* %11, i32* %13) #7, !dbg !176
  %14 = load i8*, i8** %dest, align 8, !dbg !177
  %15 = bitcast i8* %14 to i32*, !dbg !178
  call void @printWLine(i32* %15), !dbg !179
  %16 = load i8*, i8** %dest, align 8, !dbg !180
  call void @free(i8* %16) #7, !dbg !181
  ret void, !dbg !182
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9, !11}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_01_bad", scope: !19, file: !19, line: 24, type: !20, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!43 = !DILocalVariable(name: "dataLen", scope: !44, file: !19, line: 38, type: !45)
!44 = distinct !DILexicalBlock(scope: !18, file: !19, line: 36, column: 5)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !46)
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 38, column: 16, scope: !44)
!48 = !DILocation(line: 38, column: 41, scope: !44)
!49 = !DILocation(line: 38, column: 26, scope: !44)
!50 = !DILocalVariable(name: "dest", scope: !44, file: !19, line: 39, type: !4)
!51 = !DILocation(line: 39, column: 16, scope: !44)
!52 = !DILocation(line: 39, column: 38, scope: !44)
!53 = !DILocation(line: 39, column: 45, scope: !44)
!54 = !DILocation(line: 39, column: 31, scope: !44)
!55 = !DILocation(line: 40, column: 13, scope: !56)
!56 = distinct !DILexicalBlock(scope: !44, file: !19, line: 40, column: 13)
!57 = !DILocation(line: 40, column: 18, scope: !56)
!58 = !DILocation(line: 40, column: 13, scope: !44)
!59 = !DILocation(line: 40, column: 28, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !19, line: 40, column: 27)
!61 = !DILocation(line: 41, column: 22, scope: !44)
!62 = !DILocation(line: 41, column: 28, scope: !44)
!63 = !DILocation(line: 41, column: 15, scope: !44)
!64 = !DILocation(line: 42, column: 27, scope: !44)
!65 = !DILocation(line: 42, column: 9, scope: !44)
!66 = !DILocation(line: 43, column: 14, scope: !44)
!67 = !DILocation(line: 43, column: 9, scope: !44)
!68 = !DILocation(line: 45, column: 1, scope: !18)
!69 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_01_good", scope: !19, file: !19, line: 99, type: !20, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 101, column: 5, scope: !69)
!71 = !DILocation(line: 102, column: 5, scope: !69)
!72 = !DILocation(line: 103, column: 1, scope: !69)
!73 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 114, type: !74, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!8, !8, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !19, line: 114, type: !8)
!78 = !DILocation(line: 114, column: 14, scope: !73)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !19, line: 114, type: !76)
!80 = !DILocation(line: 114, column: 27, scope: !73)
!81 = !DILocation(line: 117, column: 22, scope: !73)
!82 = !DILocation(line: 117, column: 12, scope: !73)
!83 = !DILocation(line: 117, column: 5, scope: !73)
!84 = !DILocation(line: 119, column: 5, scope: !73)
!85 = !DILocation(line: 120, column: 5, scope: !73)
!86 = !DILocation(line: 121, column: 5, scope: !73)
!87 = !DILocation(line: 124, column: 5, scope: !73)
!88 = !DILocation(line: 125, column: 5, scope: !73)
!89 = !DILocation(line: 126, column: 5, scope: !73)
!90 = !DILocation(line: 128, column: 5, scope: !73)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 52, type: !20, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !19, line: 54, type: !4)
!93 = !DILocation(line: 54, column: 12, scope: !91)
!94 = !DILocation(line: 55, column: 10, scope: !91)
!95 = !DILocalVariable(name: "dataGoodBuffer", scope: !96, file: !19, line: 57, type: !9)
!96 = distinct !DILexicalBlock(scope: !91, file: !19, line: 56, column: 5)
!97 = !DILocation(line: 57, column: 16, scope: !96)
!98 = !DILocation(line: 57, column: 41, scope: !96)
!99 = !DILocation(line: 58, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !19, line: 58, column: 13)
!101 = !DILocation(line: 58, column: 28, scope: !100)
!102 = !DILocation(line: 58, column: 13, scope: !96)
!103 = !DILocation(line: 58, column: 38, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !19, line: 58, column: 37)
!105 = !DILocation(line: 59, column: 16, scope: !96)
!106 = !DILocation(line: 59, column: 9, scope: !96)
!107 = !DILocation(line: 60, column: 9, scope: !96)
!108 = !DILocation(line: 60, column: 30, scope: !96)
!109 = !DILocation(line: 62, column: 24, scope: !96)
!110 = !DILocation(line: 62, column: 14, scope: !96)
!111 = !DILocalVariable(name: "dataLen", scope: !112, file: !19, line: 66, type: !45)
!112 = distinct !DILexicalBlock(scope: !91, file: !19, line: 64, column: 5)
!113 = !DILocation(line: 66, column: 16, scope: !112)
!114 = !DILocation(line: 66, column: 41, scope: !112)
!115 = !DILocation(line: 66, column: 26, scope: !112)
!116 = !DILocalVariable(name: "dest", scope: !112, file: !19, line: 67, type: !4)
!117 = !DILocation(line: 67, column: 16, scope: !112)
!118 = !DILocation(line: 67, column: 38, scope: !112)
!119 = !DILocation(line: 67, column: 45, scope: !112)
!120 = !DILocation(line: 67, column: 31, scope: !112)
!121 = !DILocation(line: 68, column: 13, scope: !122)
!122 = distinct !DILexicalBlock(scope: !112, file: !19, line: 68, column: 13)
!123 = !DILocation(line: 68, column: 18, scope: !122)
!124 = !DILocation(line: 68, column: 13, scope: !112)
!125 = !DILocation(line: 68, column: 28, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !19, line: 68, column: 27)
!127 = !DILocation(line: 69, column: 22, scope: !112)
!128 = !DILocation(line: 69, column: 28, scope: !112)
!129 = !DILocation(line: 69, column: 15, scope: !112)
!130 = !DILocation(line: 70, column: 27, scope: !112)
!131 = !DILocation(line: 70, column: 9, scope: !112)
!132 = !DILocation(line: 71, column: 14, scope: !112)
!133 = !DILocation(line: 71, column: 9, scope: !112)
!134 = !DILocation(line: 73, column: 1, scope: !91)
!135 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 76, type: !20, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!136 = !DILocalVariable(name: "data", scope: !135, file: !19, line: 78, type: !4)
!137 = !DILocation(line: 78, column: 12, scope: !135)
!138 = !DILocation(line: 79, column: 10, scope: !135)
!139 = !DILocalVariable(name: "dataBadBuffer", scope: !140, file: !19, line: 81, type: !5)
!140 = distinct !DILexicalBlock(scope: !135, file: !19, line: 80, column: 5)
!141 = !DILocation(line: 81, column: 19, scope: !140)
!142 = !DILocation(line: 81, column: 46, scope: !140)
!143 = !DILocation(line: 81, column: 35, scope: !140)
!144 = !DILocation(line: 82, column: 13, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !19, line: 82, column: 13)
!146 = !DILocation(line: 82, column: 27, scope: !145)
!147 = !DILocation(line: 82, column: 13, scope: !140)
!148 = !DILocation(line: 82, column: 37, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !19, line: 82, column: 36)
!150 = !DILocation(line: 83, column: 17, scope: !140)
!151 = !DILocation(line: 83, column: 9, scope: !140)
!152 = !DILocation(line: 84, column: 9, scope: !140)
!153 = !DILocation(line: 84, column: 29, scope: !140)
!154 = !DILocation(line: 86, column: 24, scope: !140)
!155 = !DILocation(line: 86, column: 16, scope: !140)
!156 = !DILocation(line: 86, column: 14, scope: !140)
!157 = !DILocalVariable(name: "dataLen", scope: !158, file: !19, line: 90, type: !45)
!158 = distinct !DILexicalBlock(scope: !135, file: !19, line: 88, column: 5)
!159 = !DILocation(line: 90, column: 16, scope: !158)
!160 = !DILocation(line: 90, column: 44, scope: !158)
!161 = !DILocation(line: 90, column: 33, scope: !158)
!162 = !DILocation(line: 90, column: 26, scope: !158)
!163 = !DILocalVariable(name: "dest", scope: !158, file: !19, line: 91, type: !4)
!164 = !DILocation(line: 91, column: 16, scope: !158)
!165 = !DILocation(line: 91, column: 38, scope: !158)
!166 = !DILocation(line: 91, column: 45, scope: !158)
!167 = !DILocation(line: 91, column: 31, scope: !158)
!168 = !DILocation(line: 92, column: 13, scope: !169)
!169 = distinct !DILexicalBlock(scope: !158, file: !19, line: 92, column: 13)
!170 = !DILocation(line: 92, column: 18, scope: !169)
!171 = !DILocation(line: 92, column: 13, scope: !158)
!172 = !DILocation(line: 92, column: 28, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !19, line: 92, column: 27)
!174 = !DILocation(line: 93, column: 22, scope: !158)
!175 = !DILocation(line: 93, column: 28, scope: !158)
!176 = !DILocation(line: 93, column: 15, scope: !158)
!177 = !DILocation(line: 94, column: 31, scope: !158)
!178 = !DILocation(line: 94, column: 20, scope: !158)
!179 = !DILocation(line: 94, column: 9, scope: !158)
!180 = !DILocation(line: 95, column: 14, scope: !158)
!181 = !DILocation(line: 95, column: 9, scope: !158)
!182 = !DILocation(line: 97, column: 1, scope: !135)
