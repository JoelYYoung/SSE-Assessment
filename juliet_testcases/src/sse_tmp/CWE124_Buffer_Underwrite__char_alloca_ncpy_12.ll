; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_12.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_ncpy_12_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !23
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !24
  store i8 0, i8* %arrayidx, align 1, !dbg !25
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !26
  %tobool = icmp ne i32 %call, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.else, !dbg !28

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !31
  store i8* %add.ptr, i8** %data, align 8, !dbg !32
  br label %if.end, !dbg !33

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !34
  store i8* %4, i8** %data, align 8, !dbg !36
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !43
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !44
  store i8 0, i8* %arrayidx1, align 1, !dbg !45
  %5 = load i8*, i8** %data, align 8, !dbg !46
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !47
  %call3 = call i8* @strncpy(i8* %5, i8* %arraydecay2, i64 99) #5, !dbg !48
  %6 = load i8*, i8** %data, align 8, !dbg !49
  %arrayidx4 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !49
  store i8 0, i8* %arrayidx4, align 1, !dbg !50
  %7 = load i8*, i8** %data, align 8, !dbg !51
  call void @printLine(i8* %7), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i32 @globalReturnsTrueOrFalse(...) #3

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_ncpy_12_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #5, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #5, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE124_Buffer_Underwrite__char_alloca_ncpy_12_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE124_Buffer_Underwrite__char_alloca_ncpy_12_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = alloca i8, i64 100, align 16, !dbg !81
  store i8* %0, i8** %dataBuffer, align 8, !dbg !80
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !83
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !84
  store i8 0, i8* %arrayidx, align 1, !dbg !85
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !86
  %tobool = icmp ne i32 %call, 0, !dbg !86
  br i1 %tobool, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !89
  store i8* %3, i8** %data, align 8, !dbg !91
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !93
  store i8* %4, i8** %data, align 8, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !99
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !100
  store i8 0, i8* %arrayidx1, align 1, !dbg !101
  %5 = load i8*, i8** %data, align 8, !dbg !102
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !103
  %call3 = call i8* @strncpy(i8* %5, i8* %arraydecay2, i64 99) #5, !dbg !104
  %6 = load i8*, i8** %data, align 8, !dbg !105
  %arrayidx4 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !105
  store i8 0, i8* %arrayidx4, align 1, !dbg !106
  %7 = load i8*, i8** %data, align 8, !dbg !107
  call void @printLine(i8* %7), !dbg !108
  ret void, !dbg !109
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_ncpy_12_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_12.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 5, scope: !13)
!24 = !DILocation(line: 28, column: 5, scope: !13)
!25 = !DILocation(line: 28, column: 23, scope: !13)
!26 = !DILocation(line: 29, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 8)
!28 = !DILocation(line: 29, column: 8, scope: !13)
!29 = !DILocation(line: 32, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !14, line: 30, column: 5)
!31 = !DILocation(line: 32, column: 27, scope: !30)
!32 = !DILocation(line: 32, column: 14, scope: !30)
!33 = !DILocation(line: 33, column: 5, scope: !30)
!34 = !DILocation(line: 37, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !27, file: !14, line: 35, column: 5)
!36 = !DILocation(line: 37, column: 14, scope: !35)
!37 = !DILocalVariable(name: "source", scope: !38, file: !14, line: 40, type: !39)
!38 = distinct !DILexicalBlock(scope: !13, file: !14, line: 39, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 40, column: 14, scope: !38)
!43 = !DILocation(line: 41, column: 9, scope: !38)
!44 = !DILocation(line: 42, column: 9, scope: !38)
!45 = !DILocation(line: 42, column: 23, scope: !38)
!46 = !DILocation(line: 44, column: 17, scope: !38)
!47 = !DILocation(line: 44, column: 23, scope: !38)
!48 = !DILocation(line: 44, column: 9, scope: !38)
!49 = !DILocation(line: 46, column: 9, scope: !38)
!50 = !DILocation(line: 46, column: 21, scope: !38)
!51 = !DILocation(line: 47, column: 19, scope: !38)
!52 = !DILocation(line: 47, column: 9, scope: !38)
!53 = !DILocation(line: 49, column: 1, scope: !13)
!54 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_ncpy_12_good", scope: !14, file: !14, line: 85, type: !15, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 87, column: 5, scope: !54)
!56 = !DILocation(line: 88, column: 1, scope: !54)
!57 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 100, type: !58, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!60, !60, !61}
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !14, line: 100, type: !60)
!63 = !DILocation(line: 100, column: 14, scope: !57)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !14, line: 100, type: !61)
!65 = !DILocation(line: 100, column: 27, scope: !57)
!66 = !DILocation(line: 103, column: 22, scope: !57)
!67 = !DILocation(line: 103, column: 12, scope: !57)
!68 = !DILocation(line: 103, column: 5, scope: !57)
!69 = !DILocation(line: 105, column: 5, scope: !57)
!70 = !DILocation(line: 106, column: 5, scope: !57)
!71 = !DILocation(line: 107, column: 5, scope: !57)
!72 = !DILocation(line: 110, column: 5, scope: !57)
!73 = !DILocation(line: 111, column: 5, scope: !57)
!74 = !DILocation(line: 112, column: 5, scope: !57)
!75 = !DILocation(line: 114, column: 5, scope: !57)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 57, type: !15, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !14, line: 59, type: !4)
!78 = !DILocation(line: 59, column: 12, scope: !76)
!79 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !14, line: 60, type: !4)
!80 = !DILocation(line: 60, column: 12, scope: !76)
!81 = !DILocation(line: 60, column: 33, scope: !76)
!82 = !DILocation(line: 61, column: 12, scope: !76)
!83 = !DILocation(line: 61, column: 5, scope: !76)
!84 = !DILocation(line: 62, column: 5, scope: !76)
!85 = !DILocation(line: 62, column: 23, scope: !76)
!86 = !DILocation(line: 63, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !76, file: !14, line: 63, column: 8)
!88 = !DILocation(line: 63, column: 8, scope: !76)
!89 = !DILocation(line: 66, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !14, line: 64, column: 5)
!91 = !DILocation(line: 66, column: 14, scope: !90)
!92 = !DILocation(line: 67, column: 5, scope: !90)
!93 = !DILocation(line: 71, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !87, file: !14, line: 69, column: 5)
!95 = !DILocation(line: 71, column: 14, scope: !94)
!96 = !DILocalVariable(name: "source", scope: !97, file: !14, line: 74, type: !39)
!97 = distinct !DILexicalBlock(scope: !76, file: !14, line: 73, column: 5)
!98 = !DILocation(line: 74, column: 14, scope: !97)
!99 = !DILocation(line: 75, column: 9, scope: !97)
!100 = !DILocation(line: 76, column: 9, scope: !97)
!101 = !DILocation(line: 76, column: 23, scope: !97)
!102 = !DILocation(line: 78, column: 17, scope: !97)
!103 = !DILocation(line: 78, column: 23, scope: !97)
!104 = !DILocation(line: 78, column: 9, scope: !97)
!105 = !DILocation(line: 80, column: 9, scope: !97)
!106 = !DILocation(line: 80, column: 21, scope: !97)
!107 = !DILocation(line: 81, column: 19, scope: !97)
!108 = !DILocation(line: 81, column: 9, scope: !97)
!109 = !DILocation(line: 83, column: 1, scope: !76)
