; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_08_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  store i32* null, i32** %data, align 8, !dbg !19
  %call = call i32 @staticReturnsTrue(), !dbg !20
  %tobool = icmp ne i32 %call, 0, !dbg !20
  br i1 %tobool, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %entry
  %0 = alloca i8, i64 10, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !25
  store i32* %1, i32** %data, align 8, !dbg !26
  br label %if.end, !dbg !27

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !28, metadata !DIExpression()), !dbg !33
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !33
  %3 = load i32*, i32** %data, align 8, !dbg !34
  %4 = bitcast i32* %3 to i8*, !dbg !35
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !35
  %5 = bitcast i32* %arraydecay to i8*, !dbg !35
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 40, i1 false), !dbg !35
  %6 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !36
  %7 = load i32, i32* %arrayidx, align 4, !dbg !36
  call void @printIntLine(i32 %7), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_08_good() #0 !dbg !39 {
entry:
  call void @goodG2B1(), !dbg !40
  call void @goodG2B2(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* null) #6, !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 %conv) #6, !dbg !55
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_08_good(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_08_bad(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !63 {
entry:
  ret i32 1, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !67 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !68, metadata !DIExpression()), !dbg !69
  store i32* null, i32** %data, align 8, !dbg !70
  %call = call i32 @staticReturnsFalse(), !dbg !71
  %tobool = icmp ne i32 %call, 0, !dbg !71
  br i1 %tobool, label %if.then, label %if.else, !dbg !73

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !74
  br label %if.end, !dbg !76

if.else:                                          ; preds = %entry
  %0 = alloca i8, i64 40, align 16, !dbg !77
  %1 = bitcast i8* %0 to i32*, !dbg !79
  store i32* %1, i32** %data, align 8, !dbg !80
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !81, metadata !DIExpression()), !dbg !83
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !83
  %3 = load i32*, i32** %data, align 8, !dbg !84
  %4 = bitcast i32* %3 to i8*, !dbg !85
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !85
  %5 = bitcast i32* %arraydecay to i8*, !dbg !85
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 40, i1 false), !dbg !85
  %6 = load i32*, i32** %data, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !86
  %7 = load i32, i32* %arrayidx, align 4, !dbg !86
  call void @printIntLine(i32 %7), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !89 {
entry:
  ret i32 0, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  store i32* null, i32** %data, align 8, !dbg !94
  %call = call i32 @staticReturnsTrue(), !dbg !95
  %tobool = icmp ne i32 %call, 0, !dbg !95
  br i1 %tobool, label %if.then, label %if.end, !dbg !97

if.then:                                          ; preds = %entry
  %0 = alloca i8, i64 40, align 16, !dbg !98
  %1 = bitcast i8* %0 to i32*, !dbg !100
  store i32* %1, i32** %data, align 8, !dbg !101
  br label %if.end, !dbg !102

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !105
  %3 = load i32*, i32** %data, align 8, !dbg !106
  %4 = bitcast i32* %3 to i8*, !dbg !107
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !107
  %5 = bitcast i32* %arraydecay to i8*, !dbg !107
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 40, i1 false), !dbg !107
  %6 = load i32*, i32** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !108
  %7 = load i32, i32* %arrayidx, align 4, !dbg !108
  call void @printIntLine(i32 %7), !dbg !109
  ret void, !dbg !110
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_08_bad", scope: !14, file: !14, line: 35, type: !15, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_08.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 37, type: !4)
!18 = !DILocation(line: 37, column: 11, scope: !13)
!19 = !DILocation(line: 38, column: 10, scope: !13)
!20 = !DILocation(line: 39, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !13, file: !14, line: 39, column: 8)
!22 = !DILocation(line: 39, column: 8, scope: !13)
!23 = !DILocation(line: 42, column: 23, scope: !24)
!24 = distinct !DILexicalBlock(scope: !21, file: !14, line: 40, column: 5)
!25 = !DILocation(line: 42, column: 16, scope: !24)
!26 = !DILocation(line: 42, column: 14, scope: !24)
!27 = !DILocation(line: 43, column: 5, scope: !24)
!28 = !DILocalVariable(name: "source", scope: !29, file: !14, line: 45, type: !30)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 44, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 10)
!33 = !DILocation(line: 45, column: 13, scope: !29)
!34 = !DILocation(line: 47, column: 16, scope: !29)
!35 = !DILocation(line: 47, column: 9, scope: !29)
!36 = !DILocation(line: 48, column: 22, scope: !29)
!37 = !DILocation(line: 48, column: 9, scope: !29)
!38 = !DILocation(line: 50, column: 1, scope: !13)
!39 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_08_good", scope: !14, file: !14, line: 97, type: !15, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocation(line: 99, column: 5, scope: !39)
!41 = !DILocation(line: 100, column: 5, scope: !39)
!42 = !DILocation(line: 101, column: 1, scope: !39)
!43 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 113, type: !44, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!5, !5, !46}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !14, line: 113, type: !5)
!50 = !DILocation(line: 113, column: 14, scope: !43)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !14, line: 113, type: !46)
!52 = !DILocation(line: 113, column: 27, scope: !43)
!53 = !DILocation(line: 116, column: 22, scope: !43)
!54 = !DILocation(line: 116, column: 12, scope: !43)
!55 = !DILocation(line: 116, column: 5, scope: !43)
!56 = !DILocation(line: 118, column: 5, scope: !43)
!57 = !DILocation(line: 119, column: 5, scope: !43)
!58 = !DILocation(line: 120, column: 5, scope: !43)
!59 = !DILocation(line: 123, column: 5, scope: !43)
!60 = !DILocation(line: 124, column: 5, scope: !43)
!61 = !DILocation(line: 125, column: 5, scope: !43)
!62 = !DILocation(line: 127, column: 5, scope: !43)
!63 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !14, file: !14, line: 23, type: !64, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!5}
!66 = !DILocation(line: 25, column: 5, scope: !63)
!67 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 57, type: !15, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocalVariable(name: "data", scope: !67, file: !14, line: 59, type: !4)
!69 = !DILocation(line: 59, column: 11, scope: !67)
!70 = !DILocation(line: 60, column: 10, scope: !67)
!71 = !DILocation(line: 61, column: 8, scope: !72)
!72 = distinct !DILexicalBlock(scope: !67, file: !14, line: 61, column: 8)
!73 = !DILocation(line: 61, column: 8, scope: !67)
!74 = !DILocation(line: 64, column: 9, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !14, line: 62, column: 5)
!76 = !DILocation(line: 65, column: 5, scope: !75)
!77 = !DILocation(line: 69, column: 23, scope: !78)
!78 = distinct !DILexicalBlock(scope: !72, file: !14, line: 67, column: 5)
!79 = !DILocation(line: 69, column: 16, scope: !78)
!80 = !DILocation(line: 69, column: 14, scope: !78)
!81 = !DILocalVariable(name: "source", scope: !82, file: !14, line: 72, type: !30)
!82 = distinct !DILexicalBlock(scope: !67, file: !14, line: 71, column: 5)
!83 = !DILocation(line: 72, column: 13, scope: !82)
!84 = !DILocation(line: 74, column: 16, scope: !82)
!85 = !DILocation(line: 74, column: 9, scope: !82)
!86 = !DILocation(line: 75, column: 22, scope: !82)
!87 = !DILocation(line: 75, column: 9, scope: !82)
!88 = !DILocation(line: 77, column: 1, scope: !67)
!89 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !14, file: !14, line: 28, type: !64, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocation(line: 30, column: 5, scope: !89)
!91 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 80, type: !15, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !14, line: 82, type: !4)
!93 = !DILocation(line: 82, column: 11, scope: !91)
!94 = !DILocation(line: 83, column: 10, scope: !91)
!95 = !DILocation(line: 84, column: 8, scope: !96)
!96 = distinct !DILexicalBlock(scope: !91, file: !14, line: 84, column: 8)
!97 = !DILocation(line: 84, column: 8, scope: !91)
!98 = !DILocation(line: 87, column: 23, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !14, line: 85, column: 5)
!100 = !DILocation(line: 87, column: 16, scope: !99)
!101 = !DILocation(line: 87, column: 14, scope: !99)
!102 = !DILocation(line: 88, column: 5, scope: !99)
!103 = !DILocalVariable(name: "source", scope: !104, file: !14, line: 90, type: !30)
!104 = distinct !DILexicalBlock(scope: !91, file: !14, line: 89, column: 5)
!105 = !DILocation(line: 90, column: 13, scope: !104)
!106 = !DILocation(line: 92, column: 16, scope: !104)
!107 = !DILocation(line: 92, column: 9, scope: !104)
!108 = !DILocation(line: 93, column: 22, scope: !104)
!109 = !DILocation(line: 93, column: 9, scope: !104)
!110 = !DILocation(line: 95, column: 1, scope: !91)
