; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_08_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  %call = call i32 @staticReturnsTrue(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end3, !dbg !23

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !24
  %0 = bitcast i8* %call1 to i32*, !dbg !26
  store i32* %0, i32** %data, align 8, !dbg !27
  %1 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then2, label %if.end, !dbg !31

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !34

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !40
  %3 = load i32*, i32** %data, align 8, !dbg !41
  %4 = bitcast i32* %3 to i8*, !dbg !42
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !42
  %5 = bitcast i32* %arraydecay to i8*, !dbg !42
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 40, i1 false), !dbg !42
  %6 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !43
  %7 = load i32, i32* %arrayidx, align 4, !dbg !43
  call void @printIntLine(i32 %7), !dbg !44
  %8 = load i32*, i32** %data, align 8, !dbg !45
  %9 = bitcast i32* %8 to i8*, !dbg !45
  call void @free(i8* %9) #7, !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printIntLine(i32) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_08_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #7, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #7, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_08_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_08_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !72 {
entry:
  ret i32 1, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  store i32* null, i32** %data, align 8, !dbg !79
  %call = call i32 @staticReturnsFalse(), !dbg !80
  %tobool = icmp ne i32 %call, 0, !dbg !80
  br i1 %tobool, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  br label %if.end3, !dbg !85

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !86
  %0 = bitcast i8* %call1 to i32*, !dbg !88
  store i32* %0, i32** %data, align 8, !dbg !89
  %1 = load i32*, i32** %data, align 8, !dbg !90
  %cmp = icmp eq i32* %1, null, !dbg !92
  br i1 %cmp, label %if.then2, label %if.end, !dbg !93

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !98
  %3 = load i32*, i32** %data, align 8, !dbg !99
  %4 = bitcast i32* %3 to i8*, !dbg !100
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !100
  %5 = bitcast i32* %arraydecay to i8*, !dbg !100
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 40, i1 false), !dbg !100
  %6 = load i32*, i32** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !101
  %7 = load i32, i32* %arrayidx, align 4, !dbg !101
  call void @printIntLine(i32 %7), !dbg !102
  %8 = load i32*, i32** %data, align 8, !dbg !103
  %9 = bitcast i32* %8 to i8*, !dbg !103
  call void @free(i8* %9) #7, !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !106 {
entry:
  ret i32 0, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !DIExpression()), !dbg !110
  store i32* null, i32** %data, align 8, !dbg !111
  %call = call i32 @staticReturnsTrue(), !dbg !112
  %tobool = icmp ne i32 %call, 0, !dbg !112
  br i1 %tobool, label %if.then, label %if.end3, !dbg !114

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !115
  %0 = bitcast i8* %call1 to i32*, !dbg !117
  store i32* %0, i32** %data, align 8, !dbg !118
  %1 = load i32*, i32** %data, align 8, !dbg !119
  %cmp = icmp eq i32* %1, null, !dbg !121
  br i1 %cmp, label %if.then2, label %if.end, !dbg !122

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !123
  unreachable, !dbg !123

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !125

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !126, metadata !DIExpression()), !dbg !128
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !128
  %3 = load i32*, i32** %data, align 8, !dbg !129
  %4 = bitcast i32* %3 to i8*, !dbg !130
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !130
  %5 = bitcast i32* %arraydecay to i8*, !dbg !130
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 40, i1 false), !dbg !130
  %6 = load i32*, i32** %data, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !131
  %7 = load i32, i32* %arrayidx, align 4, !dbg !131
  call void @printIntLine(i32 %7), !dbg !132
  %8 = load i32*, i32** %data, align 8, !dbg !133
  %9 = bitcast i32* %8 to i8*, !dbg !133
  call void @free(i8* %9) #7, !dbg !134
  ret void, !dbg !135
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_08_bad", scope: !15, file: !15, line: 35, type: !16, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_08.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 37, type: !4)
!19 = !DILocation(line: 37, column: 11, scope: !14)
!20 = !DILocation(line: 38, column: 10, scope: !14)
!21 = !DILocation(line: 39, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 39, column: 8)
!23 = !DILocation(line: 39, column: 8, scope: !14)
!24 = !DILocation(line: 42, column: 23, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 40, column: 5)
!26 = !DILocation(line: 42, column: 16, scope: !25)
!27 = !DILocation(line: 42, column: 14, scope: !25)
!28 = !DILocation(line: 43, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 43, column: 13)
!30 = !DILocation(line: 43, column: 18, scope: !29)
!31 = !DILocation(line: 43, column: 13, scope: !25)
!32 = !DILocation(line: 43, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 43, column: 27)
!34 = !DILocation(line: 44, column: 5, scope: !25)
!35 = !DILocalVariable(name: "source", scope: !36, file: !15, line: 46, type: !37)
!36 = distinct !DILexicalBlock(scope: !14, file: !15, line: 45, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 10)
!40 = !DILocation(line: 46, column: 13, scope: !36)
!41 = !DILocation(line: 48, column: 17, scope: !36)
!42 = !DILocation(line: 48, column: 9, scope: !36)
!43 = !DILocation(line: 49, column: 22, scope: !36)
!44 = !DILocation(line: 49, column: 9, scope: !36)
!45 = !DILocation(line: 50, column: 14, scope: !36)
!46 = !DILocation(line: 50, column: 9, scope: !36)
!47 = !DILocation(line: 52, column: 1, scope: !14)
!48 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_08_good", scope: !15, file: !15, line: 103, type: !16, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 105, column: 5, scope: !48)
!50 = !DILocation(line: 106, column: 5, scope: !48)
!51 = !DILocation(line: 107, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 119, type: !53, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!5, !5, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !15, line: 119, type: !5)
!59 = !DILocation(line: 119, column: 14, scope: !52)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !15, line: 119, type: !55)
!61 = !DILocation(line: 119, column: 27, scope: !52)
!62 = !DILocation(line: 122, column: 22, scope: !52)
!63 = !DILocation(line: 122, column: 12, scope: !52)
!64 = !DILocation(line: 122, column: 5, scope: !52)
!65 = !DILocation(line: 124, column: 5, scope: !52)
!66 = !DILocation(line: 125, column: 5, scope: !52)
!67 = !DILocation(line: 126, column: 5, scope: !52)
!68 = !DILocation(line: 129, column: 5, scope: !52)
!69 = !DILocation(line: 130, column: 5, scope: !52)
!70 = !DILocation(line: 131, column: 5, scope: !52)
!71 = !DILocation(line: 133, column: 5, scope: !52)
!72 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 23, type: !73, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!5}
!75 = !DILocation(line: 25, column: 5, scope: !72)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 59, type: !16, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !15, line: 61, type: !4)
!78 = !DILocation(line: 61, column: 11, scope: !76)
!79 = !DILocation(line: 62, column: 10, scope: !76)
!80 = !DILocation(line: 63, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !15, line: 63, column: 8)
!82 = !DILocation(line: 63, column: 8, scope: !76)
!83 = !DILocation(line: 66, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !15, line: 64, column: 5)
!85 = !DILocation(line: 67, column: 5, scope: !84)
!86 = !DILocation(line: 71, column: 23, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !15, line: 69, column: 5)
!88 = !DILocation(line: 71, column: 16, scope: !87)
!89 = !DILocation(line: 71, column: 14, scope: !87)
!90 = !DILocation(line: 72, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !15, line: 72, column: 13)
!92 = !DILocation(line: 72, column: 18, scope: !91)
!93 = !DILocation(line: 72, column: 13, scope: !87)
!94 = !DILocation(line: 72, column: 28, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !15, line: 72, column: 27)
!96 = !DILocalVariable(name: "source", scope: !97, file: !15, line: 75, type: !37)
!97 = distinct !DILexicalBlock(scope: !76, file: !15, line: 74, column: 5)
!98 = !DILocation(line: 75, column: 13, scope: !97)
!99 = !DILocation(line: 77, column: 17, scope: !97)
!100 = !DILocation(line: 77, column: 9, scope: !97)
!101 = !DILocation(line: 78, column: 22, scope: !97)
!102 = !DILocation(line: 78, column: 9, scope: !97)
!103 = !DILocation(line: 79, column: 14, scope: !97)
!104 = !DILocation(line: 79, column: 9, scope: !97)
!105 = !DILocation(line: 81, column: 1, scope: !76)
!106 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 28, type: !73, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocation(line: 30, column: 5, scope: !106)
!108 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 84, type: !16, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !15, line: 86, type: !4)
!110 = !DILocation(line: 86, column: 11, scope: !108)
!111 = !DILocation(line: 87, column: 10, scope: !108)
!112 = !DILocation(line: 88, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !108, file: !15, line: 88, column: 8)
!114 = !DILocation(line: 88, column: 8, scope: !108)
!115 = !DILocation(line: 91, column: 23, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !15, line: 89, column: 5)
!117 = !DILocation(line: 91, column: 16, scope: !116)
!118 = !DILocation(line: 91, column: 14, scope: !116)
!119 = !DILocation(line: 92, column: 13, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !15, line: 92, column: 13)
!121 = !DILocation(line: 92, column: 18, scope: !120)
!122 = !DILocation(line: 92, column: 13, scope: !116)
!123 = !DILocation(line: 92, column: 28, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !15, line: 92, column: 27)
!125 = !DILocation(line: 93, column: 5, scope: !116)
!126 = !DILocalVariable(name: "source", scope: !127, file: !15, line: 95, type: !37)
!127 = distinct !DILexicalBlock(scope: !108, file: !15, line: 94, column: 5)
!128 = !DILocation(line: 95, column: 13, scope: !127)
!129 = !DILocation(line: 97, column: 17, scope: !127)
!130 = !DILocation(line: 97, column: 9, scope: !127)
!131 = !DILocation(line: 98, column: 22, scope: !127)
!132 = !DILocation(line: 98, column: 9, scope: !127)
!133 = !DILocation(line: 99, column: 14, scope: !127)
!134 = !DILocation(line: 99, column: 9, scope: !127)
!135 = !DILocation(line: 101, column: 1, scope: !108)
