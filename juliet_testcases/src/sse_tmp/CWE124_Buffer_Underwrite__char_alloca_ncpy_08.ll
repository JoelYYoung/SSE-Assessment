; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_08.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_ncpy_08_bad() #0 !dbg !13 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !26
  %tobool = icmp ne i32 %call, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !31
  store i8* %add.ptr, i8** %data, align 8, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !40
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !41
  store i8 0, i8* %arrayidx1, align 1, !dbg !42
  %4 = load i8*, i8** %data, align 8, !dbg !43
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !44
  %call3 = call i8* @strncpy(i8* %4, i8* %arraydecay2, i64 99) #5, !dbg !45
  %5 = load i8*, i8** %data, align 8, !dbg !46
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !46
  store i8 0, i8* %arrayidx4, align 1, !dbg !47
  %6 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* %6), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_ncpy_08_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #5, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #5, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE124_Buffer_Underwrite__char_alloca_ncpy_08_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE124_Buffer_Underwrite__char_alloca_ncpy_08_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !74 {
entry:
  ret i32 1, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = alloca i8, i64 100, align 16, !dbg !83
  store i8* %0, i8** %dataBuffer, align 8, !dbg !82
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !85
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !86
  store i8 0, i8* %arrayidx, align 1, !dbg !87
  %call = call i32 @staticReturnsFalse(), !dbg !88
  %tobool = icmp ne i32 %call, 0, !dbg !88
  br i1 %tobool, label %if.then, label %if.else, !dbg !90

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  br label %if.end, !dbg !93

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !94
  store i8* %3, i8** %data, align 8, !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !100
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !101
  store i8 0, i8* %arrayidx1, align 1, !dbg !102
  %4 = load i8*, i8** %data, align 8, !dbg !103
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !104
  %call3 = call i8* @strncpy(i8* %4, i8* %arraydecay2, i64 99) #5, !dbg !105
  %5 = load i8*, i8** %data, align 8, !dbg !106
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !106
  store i8 0, i8* %arrayidx4, align 1, !dbg !107
  %6 = load i8*, i8** %data, align 8, !dbg !108
  call void @printLine(i8* %6), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !111 {
entry:
  ret i32 0, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !113 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %0 = alloca i8, i64 100, align 16, !dbg !118
  store i8* %0, i8** %dataBuffer, align 8, !dbg !117
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !120
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !121
  store i8 0, i8* %arrayidx, align 1, !dbg !122
  %call = call i32 @staticReturnsTrue(), !dbg !123
  %tobool = icmp ne i32 %call, 0, !dbg !123
  br i1 %tobool, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !126
  store i8* %3, i8** %data, align 8, !dbg !128
  br label %if.end, !dbg !129

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !130, metadata !DIExpression()), !dbg !132
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !133
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !133
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !134
  store i8 0, i8* %arrayidx1, align 1, !dbg !135
  %4 = load i8*, i8** %data, align 8, !dbg !136
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !137
  %call3 = call i8* @strncpy(i8* %4, i8* %arraydecay2, i64 99) #5, !dbg !138
  %5 = load i8*, i8** %data, align 8, !dbg !139
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !139
  store i8 0, i8* %arrayidx4, align 1, !dbg !140
  %6 = load i8*, i8** %data, align 8, !dbg !141
  call void @printLine(i8* %6), !dbg !142
  ret void, !dbg !143
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_ncpy_08_bad", scope: !14, file: !14, line: 37, type: !15, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 39, type: !4)
!18 = !DILocation(line: 39, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 40, type: !4)
!20 = !DILocation(line: 40, column: 12, scope: !13)
!21 = !DILocation(line: 40, column: 33, scope: !13)
!22 = !DILocation(line: 41, column: 12, scope: !13)
!23 = !DILocation(line: 41, column: 5, scope: !13)
!24 = !DILocation(line: 42, column: 5, scope: !13)
!25 = !DILocation(line: 42, column: 23, scope: !13)
!26 = !DILocation(line: 43, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 43, column: 8)
!28 = !DILocation(line: 43, column: 8, scope: !13)
!29 = !DILocation(line: 46, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !14, line: 44, column: 5)
!31 = !DILocation(line: 46, column: 27, scope: !30)
!32 = !DILocation(line: 46, column: 14, scope: !30)
!33 = !DILocation(line: 47, column: 5, scope: !30)
!34 = !DILocalVariable(name: "source", scope: !35, file: !14, line: 49, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 48, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 49, column: 14, scope: !35)
!40 = !DILocation(line: 50, column: 9, scope: !35)
!41 = !DILocation(line: 51, column: 9, scope: !35)
!42 = !DILocation(line: 51, column: 23, scope: !35)
!43 = !DILocation(line: 53, column: 17, scope: !35)
!44 = !DILocation(line: 53, column: 23, scope: !35)
!45 = !DILocation(line: 53, column: 9, scope: !35)
!46 = !DILocation(line: 55, column: 9, scope: !35)
!47 = !DILocation(line: 55, column: 21, scope: !35)
!48 = !DILocation(line: 56, column: 19, scope: !35)
!49 = !DILocation(line: 56, column: 9, scope: !35)
!50 = !DILocation(line: 58, column: 1, scope: !13)
!51 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_ncpy_08_good", scope: !14, file: !14, line: 117, type: !15, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 119, column: 5, scope: !51)
!53 = !DILocation(line: 120, column: 5, scope: !51)
!54 = !DILocation(line: 121, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 133, type: !56, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !14, line: 133, type: !58)
!61 = !DILocation(line: 133, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !14, line: 133, type: !59)
!63 = !DILocation(line: 133, column: 27, scope: !55)
!64 = !DILocation(line: 136, column: 22, scope: !55)
!65 = !DILocation(line: 136, column: 12, scope: !55)
!66 = !DILocation(line: 136, column: 5, scope: !55)
!67 = !DILocation(line: 138, column: 5, scope: !55)
!68 = !DILocation(line: 139, column: 5, scope: !55)
!69 = !DILocation(line: 140, column: 5, scope: !55)
!70 = !DILocation(line: 143, column: 5, scope: !55)
!71 = !DILocation(line: 144, column: 5, scope: !55)
!72 = !DILocation(line: 145, column: 5, scope: !55)
!73 = !DILocation(line: 147, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !14, file: !14, line: 25, type: !75, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!58}
!77 = !DILocation(line: 27, column: 5, scope: !74)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 65, type: !15, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !14, line: 67, type: !4)
!80 = !DILocation(line: 67, column: 12, scope: !78)
!81 = !DILocalVariable(name: "dataBuffer", scope: !78, file: !14, line: 68, type: !4)
!82 = !DILocation(line: 68, column: 12, scope: !78)
!83 = !DILocation(line: 68, column: 33, scope: !78)
!84 = !DILocation(line: 69, column: 12, scope: !78)
!85 = !DILocation(line: 69, column: 5, scope: !78)
!86 = !DILocation(line: 70, column: 5, scope: !78)
!87 = !DILocation(line: 70, column: 23, scope: !78)
!88 = !DILocation(line: 71, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !78, file: !14, line: 71, column: 8)
!90 = !DILocation(line: 71, column: 8, scope: !78)
!91 = !DILocation(line: 74, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !14, line: 72, column: 5)
!93 = !DILocation(line: 75, column: 5, scope: !92)
!94 = !DILocation(line: 79, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !89, file: !14, line: 77, column: 5)
!96 = !DILocation(line: 79, column: 14, scope: !95)
!97 = !DILocalVariable(name: "source", scope: !98, file: !14, line: 82, type: !36)
!98 = distinct !DILexicalBlock(scope: !78, file: !14, line: 81, column: 5)
!99 = !DILocation(line: 82, column: 14, scope: !98)
!100 = !DILocation(line: 83, column: 9, scope: !98)
!101 = !DILocation(line: 84, column: 9, scope: !98)
!102 = !DILocation(line: 84, column: 23, scope: !98)
!103 = !DILocation(line: 86, column: 17, scope: !98)
!104 = !DILocation(line: 86, column: 23, scope: !98)
!105 = !DILocation(line: 86, column: 9, scope: !98)
!106 = !DILocation(line: 88, column: 9, scope: !98)
!107 = !DILocation(line: 88, column: 21, scope: !98)
!108 = !DILocation(line: 89, column: 19, scope: !98)
!109 = !DILocation(line: 89, column: 9, scope: !98)
!110 = !DILocation(line: 91, column: 1, scope: !78)
!111 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !14, file: !14, line: 30, type: !75, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocation(line: 32, column: 5, scope: !111)
!113 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 94, type: !15, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !14, line: 96, type: !4)
!115 = !DILocation(line: 96, column: 12, scope: !113)
!116 = !DILocalVariable(name: "dataBuffer", scope: !113, file: !14, line: 97, type: !4)
!117 = !DILocation(line: 97, column: 12, scope: !113)
!118 = !DILocation(line: 97, column: 33, scope: !113)
!119 = !DILocation(line: 98, column: 12, scope: !113)
!120 = !DILocation(line: 98, column: 5, scope: !113)
!121 = !DILocation(line: 99, column: 5, scope: !113)
!122 = !DILocation(line: 99, column: 23, scope: !113)
!123 = !DILocation(line: 100, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !113, file: !14, line: 100, column: 8)
!125 = !DILocation(line: 100, column: 8, scope: !113)
!126 = !DILocation(line: 103, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !14, line: 101, column: 5)
!128 = !DILocation(line: 103, column: 14, scope: !127)
!129 = !DILocation(line: 104, column: 5, scope: !127)
!130 = !DILocalVariable(name: "source", scope: !131, file: !14, line: 106, type: !36)
!131 = distinct !DILexicalBlock(scope: !113, file: !14, line: 105, column: 5)
!132 = !DILocation(line: 106, column: 14, scope: !131)
!133 = !DILocation(line: 107, column: 9, scope: !131)
!134 = !DILocation(line: 108, column: 9, scope: !131)
!135 = !DILocation(line: 108, column: 23, scope: !131)
!136 = !DILocation(line: 110, column: 17, scope: !131)
!137 = !DILocation(line: 110, column: 23, scope: !131)
!138 = !DILocation(line: 110, column: 9, scope: !131)
!139 = !DILocation(line: 112, column: 9, scope: !131)
!140 = !DILocation(line: 112, column: 21, scope: !131)
!141 = !DILocation(line: 113, column: 19, scope: !131)
!142 = !DILocation(line: 113, column: 9, scope: !131)
!143 = !DILocation(line: 115, column: 1, scope: !113)
