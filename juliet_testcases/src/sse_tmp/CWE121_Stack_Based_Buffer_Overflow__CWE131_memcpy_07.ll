; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_07_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32, i32* @staticFive, align 4, !dbg !23
  %cmp = icmp eq i32 %0, 5, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  %1 = alloca i8, i64 10, align 16, !dbg !27
  %2 = bitcast i8* %1 to i32*, !dbg !29
  store i32* %2, i32** %data, align 8, !dbg !30
  br label %if.end, !dbg !31

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !37
  %4 = load i32*, i32** %data, align 8, !dbg !38
  %5 = bitcast i32* %4 to i8*, !dbg !39
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !39
  %6 = bitcast i32* %arraydecay to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 40, i1 false), !dbg !39
  %7 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !40
  %8 = load i32, i32* %arrayidx, align 4, !dbg !40
  call void @printIntLine(i32 %8), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_07_good() #0 !dbg !43 {
entry:
  call void @goodG2B1(), !dbg !44
  call void @goodG2B2(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #6, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #6, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_07_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_07_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !67 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !68, metadata !DIExpression()), !dbg !69
  store i32* null, i32** %data, align 8, !dbg !70
  %0 = load i32, i32* @staticFive, align 4, !dbg !71
  %cmp = icmp ne i32 %0, 5, !dbg !73
  br i1 %cmp, label %if.then, label %if.else, !dbg !74

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !75
  br label %if.end, !dbg !77

if.else:                                          ; preds = %entry
  %1 = alloca i8, i64 40, align 16, !dbg !78
  %2 = bitcast i8* %1 to i32*, !dbg !80
  store i32* %2, i32** %data, align 8, !dbg !81
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !82, metadata !DIExpression()), !dbg !84
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !84
  %4 = load i32*, i32** %data, align 8, !dbg !85
  %5 = bitcast i32* %4 to i8*, !dbg !86
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !86
  %6 = bitcast i32* %arraydecay to i8*, !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 40, i1 false), !dbg !86
  %7 = load i32*, i32** %data, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !87
  %8 = load i32, i32* %arrayidx, align 4, !dbg !87
  call void @printIntLine(i32 %8), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  store i32* null, i32** %data, align 8, !dbg !93
  %0 = load i32, i32* @staticFive, align 4, !dbg !94
  %cmp = icmp eq i32 %0, 5, !dbg !96
  br i1 %cmp, label %if.then, label %if.end, !dbg !97

if.then:                                          ; preds = %entry
  %1 = alloca i8, i64 40, align 16, !dbg !98
  %2 = bitcast i8* %1 to i32*, !dbg !100
  store i32* %2, i32** %data, align 8, !dbg !101
  br label %if.end, !dbg !102

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %3 = bitcast [10 x i32]* %source to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !105
  %4 = load i32*, i32** %data, align 8, !dbg !106
  %5 = bitcast i32* %4 to i8*, !dbg !107
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !107
  %6 = bitcast i32* %arraydecay to i8*, !dbg !107
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 40, i1 false), !dbg !107
  %7 = load i32*, i32** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !108
  %8 = load i32, i32* %arrayidx, align 4, !dbg !108
  call void @printIntLine(i32 %8), !dbg !109
  ret void, !dbg !110
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !10, line: 23, type: !7, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0}
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_07.c", directory: "/root/SSE-Assessment")
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_07_bad", scope: !10, file: !10, line: 27, type: !18, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !17, file: !10, line: 29, type: !6)
!21 = !DILocation(line: 29, column: 11, scope: !17)
!22 = !DILocation(line: 30, column: 10, scope: !17)
!23 = !DILocation(line: 31, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !17, file: !10, line: 31, column: 8)
!25 = !DILocation(line: 31, column: 18, scope: !24)
!26 = !DILocation(line: 31, column: 8, scope: !17)
!27 = !DILocation(line: 34, column: 23, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !10, line: 32, column: 5)
!29 = !DILocation(line: 34, column: 16, scope: !28)
!30 = !DILocation(line: 34, column: 14, scope: !28)
!31 = !DILocation(line: 35, column: 5, scope: !28)
!32 = !DILocalVariable(name: "source", scope: !33, file: !10, line: 37, type: !34)
!33 = distinct !DILexicalBlock(scope: !17, file: !10, line: 36, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 320, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 10)
!37 = !DILocation(line: 37, column: 13, scope: !33)
!38 = !DILocation(line: 39, column: 16, scope: !33)
!39 = !DILocation(line: 39, column: 9, scope: !33)
!40 = !DILocation(line: 40, column: 22, scope: !33)
!41 = !DILocation(line: 40, column: 9, scope: !33)
!42 = !DILocation(line: 42, column: 1, scope: !17)
!43 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_07_good", scope: !10, file: !10, line: 89, type: !18, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DILocation(line: 91, column: 5, scope: !43)
!45 = !DILocation(line: 92, column: 5, scope: !43)
!46 = !DILocation(line: 93, column: 1, scope: !43)
!47 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 105, type: !48, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DISubroutineType(types: !49)
!49 = !{!7, !7, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !10, line: 105, type: !7)
!54 = !DILocation(line: 105, column: 14, scope: !47)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !10, line: 105, type: !50)
!56 = !DILocation(line: 105, column: 27, scope: !47)
!57 = !DILocation(line: 108, column: 22, scope: !47)
!58 = !DILocation(line: 108, column: 12, scope: !47)
!59 = !DILocation(line: 108, column: 5, scope: !47)
!60 = !DILocation(line: 110, column: 5, scope: !47)
!61 = !DILocation(line: 111, column: 5, scope: !47)
!62 = !DILocation(line: 112, column: 5, scope: !47)
!63 = !DILocation(line: 115, column: 5, scope: !47)
!64 = !DILocation(line: 116, column: 5, scope: !47)
!65 = !DILocation(line: 117, column: 5, scope: !47)
!66 = !DILocation(line: 119, column: 5, scope: !47)
!67 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 49, type: !18, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocalVariable(name: "data", scope: !67, file: !10, line: 51, type: !6)
!69 = !DILocation(line: 51, column: 11, scope: !67)
!70 = !DILocation(line: 52, column: 10, scope: !67)
!71 = !DILocation(line: 53, column: 8, scope: !72)
!72 = distinct !DILexicalBlock(scope: !67, file: !10, line: 53, column: 8)
!73 = !DILocation(line: 53, column: 18, scope: !72)
!74 = !DILocation(line: 53, column: 8, scope: !67)
!75 = !DILocation(line: 56, column: 9, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !10, line: 54, column: 5)
!77 = !DILocation(line: 57, column: 5, scope: !76)
!78 = !DILocation(line: 61, column: 23, scope: !79)
!79 = distinct !DILexicalBlock(scope: !72, file: !10, line: 59, column: 5)
!80 = !DILocation(line: 61, column: 16, scope: !79)
!81 = !DILocation(line: 61, column: 14, scope: !79)
!82 = !DILocalVariable(name: "source", scope: !83, file: !10, line: 64, type: !34)
!83 = distinct !DILexicalBlock(scope: !67, file: !10, line: 63, column: 5)
!84 = !DILocation(line: 64, column: 13, scope: !83)
!85 = !DILocation(line: 66, column: 16, scope: !83)
!86 = !DILocation(line: 66, column: 9, scope: !83)
!87 = !DILocation(line: 67, column: 22, scope: !83)
!88 = !DILocation(line: 67, column: 9, scope: !83)
!89 = !DILocation(line: 69, column: 1, scope: !67)
!90 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 72, type: !18, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DILocalVariable(name: "data", scope: !90, file: !10, line: 74, type: !6)
!92 = !DILocation(line: 74, column: 11, scope: !90)
!93 = !DILocation(line: 75, column: 10, scope: !90)
!94 = !DILocation(line: 76, column: 8, scope: !95)
!95 = distinct !DILexicalBlock(scope: !90, file: !10, line: 76, column: 8)
!96 = !DILocation(line: 76, column: 18, scope: !95)
!97 = !DILocation(line: 76, column: 8, scope: !90)
!98 = !DILocation(line: 79, column: 23, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !10, line: 77, column: 5)
!100 = !DILocation(line: 79, column: 16, scope: !99)
!101 = !DILocation(line: 79, column: 14, scope: !99)
!102 = !DILocation(line: 80, column: 5, scope: !99)
!103 = !DILocalVariable(name: "source", scope: !104, file: !10, line: 82, type: !34)
!104 = distinct !DILexicalBlock(scope: !90, file: !10, line: 81, column: 5)
!105 = !DILocation(line: 82, column: 13, scope: !104)
!106 = !DILocation(line: 84, column: 16, scope: !104)
!107 = !DILocation(line: 84, column: 9, scope: !104)
!108 = !DILocation(line: 85, column: 22, scope: !104)
!109 = !DILocation(line: 85, column: 9, scope: !104)
!110 = !DILocation(line: 87, column: 1, scope: !90)
