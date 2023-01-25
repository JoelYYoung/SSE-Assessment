; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_15_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  store i8* %1, i8** %data, align 8, !dbg !23
  %2 = load i8*, i8** %data, align 8, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !25
  %3 = load i8*, i8** %data, align 8, !dbg !26
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !26
  store i8 0, i8* %arrayidx, align 1, !dbg !27
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !28, metadata !DIExpression()), !dbg !33
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !34
  %5 = load i8*, i8** %data, align 8, !dbg !35
  %call = call i8* @strcat(i8* %arraydecay, i8* %5) #5, !dbg !36
  %6 = load i8*, i8** %data, align 8, !dbg !37
  call void @printLine(i8* %6), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_15_good() #0 !dbg !40 {
entry:
  call void @goodG2B1(), !dbg !41
  call void @goodG2B2(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* null) #5, !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 %conv) #5, !dbg !55
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_15_good(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_15_bad(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !63 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !66, metadata !DIExpression()), !dbg !67
  %0 = alloca i8, i64 100, align 16, !dbg !68
  store i8* %0, i8** %dataBuffer, align 8, !dbg !67
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !69
  store i8* %1, i8** %data, align 8, !dbg !70
  %2 = load i8*, i8** %data, align 8, !dbg !71
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !72
  %3 = load i8*, i8** %data, align 8, !dbg !73
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !73
  store i8 0, i8* %arrayidx, align 1, !dbg !74
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !75, metadata !DIExpression()), !dbg !77
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !77
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !77
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !78
  %5 = load i8*, i8** %data, align 8, !dbg !79
  %call = call i8* @strcat(i8* %arraydecay, i8* %5) #5, !dbg !80
  %6 = load i8*, i8** %data, align 8, !dbg !81
  call void @printLine(i8* %6), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !84 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %0 = alloca i8, i64 100, align 16, !dbg !89
  store i8* %0, i8** %dataBuffer, align 8, !dbg !88
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !90
  store i8* %1, i8** %data, align 8, !dbg !91
  %2 = load i8*, i8** %data, align 8, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !93
  %3 = load i8*, i8** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !96, metadata !DIExpression()), !dbg !98
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !98
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !99
  %5 = load i8*, i8** %data, align 8, !dbg !100
  %call = call i8* @strcat(i8* %arraydecay, i8* %5) #5, !dbg !101
  %6 = load i8*, i8** %data, align 8, !dbg !102
  call void @printLine(i8* %6), !dbg !103
  ret void, !dbg !104
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_15_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_15.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 10, scope: !13)
!24 = !DILocation(line: 32, column: 16, scope: !13)
!25 = !DILocation(line: 32, column: 9, scope: !13)
!26 = !DILocation(line: 33, column: 9, scope: !13)
!27 = !DILocation(line: 33, column: 21, scope: !13)
!28 = !DILocalVariable(name: "dest", scope: !29, file: !14, line: 41, type: !30)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 50)
!33 = !DILocation(line: 41, column: 14, scope: !29)
!34 = !DILocation(line: 43, column: 16, scope: !29)
!35 = !DILocation(line: 43, column: 22, scope: !29)
!36 = !DILocation(line: 43, column: 9, scope: !29)
!37 = !DILocation(line: 44, column: 19, scope: !29)
!38 = !DILocation(line: 44, column: 9, scope: !29)
!39 = !DILocation(line: 46, column: 1, scope: !13)
!40 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_15_good", scope: !14, file: !14, line: 104, type: !15, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 106, column: 5, scope: !40)
!42 = !DILocation(line: 107, column: 5, scope: !40)
!43 = !DILocation(line: 108, column: 1, scope: !40)
!44 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 120, type: !45, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!47, !47, !48}
!47 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !14, line: 120, type: !47)
!50 = !DILocation(line: 120, column: 14, scope: !44)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !14, line: 120, type: !48)
!52 = !DILocation(line: 120, column: 27, scope: !44)
!53 = !DILocation(line: 123, column: 22, scope: !44)
!54 = !DILocation(line: 123, column: 12, scope: !44)
!55 = !DILocation(line: 123, column: 5, scope: !44)
!56 = !DILocation(line: 125, column: 5, scope: !44)
!57 = !DILocation(line: 126, column: 5, scope: !44)
!58 = !DILocation(line: 127, column: 5, scope: !44)
!59 = !DILocation(line: 130, column: 5, scope: !44)
!60 = !DILocation(line: 131, column: 5, scope: !44)
!61 = !DILocation(line: 132, column: 5, scope: !44)
!62 = !DILocation(line: 134, column: 5, scope: !44)
!63 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocalVariable(name: "data", scope: !63, file: !14, line: 55, type: !4)
!65 = !DILocation(line: 55, column: 12, scope: !63)
!66 = !DILocalVariable(name: "dataBuffer", scope: !63, file: !14, line: 56, type: !4)
!67 = !DILocation(line: 56, column: 12, scope: !63)
!68 = !DILocation(line: 56, column: 33, scope: !63)
!69 = !DILocation(line: 57, column: 12, scope: !63)
!70 = !DILocation(line: 57, column: 10, scope: !63)
!71 = !DILocation(line: 66, column: 16, scope: !63)
!72 = !DILocation(line: 66, column: 9, scope: !63)
!73 = !DILocation(line: 67, column: 9, scope: !63)
!74 = !DILocation(line: 67, column: 20, scope: !63)
!75 = !DILocalVariable(name: "dest", scope: !76, file: !14, line: 71, type: !30)
!76 = distinct !DILexicalBlock(scope: !63, file: !14, line: 70, column: 5)
!77 = !DILocation(line: 71, column: 14, scope: !76)
!78 = !DILocation(line: 73, column: 16, scope: !76)
!79 = !DILocation(line: 73, column: 22, scope: !76)
!80 = !DILocation(line: 73, column: 9, scope: !76)
!81 = !DILocation(line: 74, column: 19, scope: !76)
!82 = !DILocation(line: 74, column: 9, scope: !76)
!83 = !DILocation(line: 76, column: 1, scope: !63)
!84 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 79, type: !15, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !14, line: 81, type: !4)
!86 = !DILocation(line: 81, column: 12, scope: !84)
!87 = !DILocalVariable(name: "dataBuffer", scope: !84, file: !14, line: 82, type: !4)
!88 = !DILocation(line: 82, column: 12, scope: !84)
!89 = !DILocation(line: 82, column: 33, scope: !84)
!90 = !DILocation(line: 83, column: 12, scope: !84)
!91 = !DILocation(line: 83, column: 10, scope: !84)
!92 = !DILocation(line: 88, column: 16, scope: !84)
!93 = !DILocation(line: 88, column: 9, scope: !84)
!94 = !DILocation(line: 89, column: 9, scope: !84)
!95 = !DILocation(line: 89, column: 20, scope: !84)
!96 = !DILocalVariable(name: "dest", scope: !97, file: !14, line: 97, type: !30)
!97 = distinct !DILexicalBlock(scope: !84, file: !14, line: 96, column: 5)
!98 = !DILocation(line: 97, column: 14, scope: !97)
!99 = !DILocation(line: 99, column: 16, scope: !97)
!100 = !DILocation(line: 99, column: 22, scope: !97)
!101 = !DILocation(line: 99, column: 9, scope: !97)
!102 = !DILocation(line: 100, column: 19, scope: !97)
!103 = !DILocation(line: 100, column: 9, scope: !97)
!104 = !DILocation(line: 102, column: 1, scope: !84)
