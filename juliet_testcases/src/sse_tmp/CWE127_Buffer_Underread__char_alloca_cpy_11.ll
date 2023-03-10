; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_cpy_11.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_cpy_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_cpy_11_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !23
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !24
  store i8 0, i8* %arrayidx, align 1, !dbg !25
  %call = call i32 (...) @globalReturnsTrue(), !dbg !26
  %tobool = icmp ne i32 %call, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !31
  store i8* %add.ptr, i8** %data, align 8, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !40
  %arrayidx1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !41
  store i8 0, i8* %arrayidx1, align 1, !dbg !42
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !43
  %4 = load i8*, i8** %data, align 8, !dbg !44
  %call3 = call i8* @strcpy(i8* %arraydecay2, i8* %4) #5, !dbg !45
  %arraydecay4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !46
  call void @printLine(i8* %arraydecay4), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i32 @globalReturnsTrue(...) #3

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_cpy_11_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #5, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #5, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE127_Buffer_Underread__char_alloca_cpy_11_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE127_Buffer_Underread__char_alloca_cpy_11_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = alloca i8, i64 100, align 16, !dbg !77
  store i8* %0, i8** %dataBuffer, align 8, !dbg !76
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !78
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !79
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !80
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !80
  store i8 0, i8* %arrayidx, align 1, !dbg !81
  %call = call i32 (...) @globalReturnsFalse(), !dbg !82
  %tobool = icmp ne i32 %call, 0, !dbg !82
  br i1 %tobool, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  br label %if.end, !dbg !87

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !88
  store i8* %3, i8** %data, align 8, !dbg !90
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !91, metadata !DIExpression()), !dbg !93
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !94
  %arrayidx1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !95
  store i8 0, i8* %arrayidx1, align 1, !dbg !96
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !97
  %4 = load i8*, i8** %data, align 8, !dbg !98
  %call3 = call i8* @strcpy(i8* %arraydecay2, i8* %4) #5, !dbg !99
  %arraydecay4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !100
  call void @printLine(i8* %arraydecay4), !dbg !101
  ret void, !dbg !102
}

declare dso_local i32 @globalReturnsFalse(...) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = alloca i8, i64 100, align 16, !dbg !108
  store i8* %0, i8** %dataBuffer, align 8, !dbg !107
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !110
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !111
  store i8 0, i8* %arrayidx, align 1, !dbg !112
  %call = call i32 (...) @globalReturnsTrue(), !dbg !113
  %tobool = icmp ne i32 %call, 0, !dbg !113
  br i1 %tobool, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !116
  store i8* %3, i8** %data, align 8, !dbg !118
  br label %if.end, !dbg !119

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !120, metadata !DIExpression()), !dbg !122
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !123
  %arrayidx1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !124
  store i8 0, i8* %arrayidx1, align 1, !dbg !125
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !126
  %4 = load i8*, i8** %data, align 8, !dbg !127
  %call3 = call i8* @strcpy(i8* %arraydecay2, i8* %4) #5, !dbg !128
  %arraydecay4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !129
  call void @printLine(i8* %arraydecay4), !dbg !130
  ret void, !dbg !131
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_cpy_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_cpy_11_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_cpy_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!34 = !DILocalVariable(name: "dest", scope: !35, file: !14, line: 35, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 200)
!39 = !DILocation(line: 35, column: 14, scope: !35)
!40 = !DILocation(line: 36, column: 9, scope: !35)
!41 = !DILocation(line: 37, column: 9, scope: !35)
!42 = !DILocation(line: 37, column: 23, scope: !35)
!43 = !DILocation(line: 39, column: 16, scope: !35)
!44 = !DILocation(line: 39, column: 22, scope: !35)
!45 = !DILocation(line: 39, column: 9, scope: !35)
!46 = !DILocation(line: 40, column: 19, scope: !35)
!47 = !DILocation(line: 40, column: 9, scope: !35)
!48 = !DILocation(line: 42, column: 1, scope: !13)
!49 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_cpy_11_good", scope: !14, file: !14, line: 97, type: !15, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 99, column: 5, scope: !49)
!51 = !DILocation(line: 100, column: 5, scope: !49)
!52 = !DILocation(line: 101, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 113, type: !54, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !14, line: 113, type: !56)
!59 = !DILocation(line: 113, column: 14, scope: !53)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !14, line: 113, type: !57)
!61 = !DILocation(line: 113, column: 27, scope: !53)
!62 = !DILocation(line: 116, column: 22, scope: !53)
!63 = !DILocation(line: 116, column: 12, scope: !53)
!64 = !DILocation(line: 116, column: 5, scope: !53)
!65 = !DILocation(line: 118, column: 5, scope: !53)
!66 = !DILocation(line: 119, column: 5, scope: !53)
!67 = !DILocation(line: 120, column: 5, scope: !53)
!68 = !DILocation(line: 123, column: 5, scope: !53)
!69 = !DILocation(line: 124, column: 5, scope: !53)
!70 = !DILocation(line: 125, column: 5, scope: !53)
!71 = !DILocation(line: 127, column: 5, scope: !53)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 49, type: !15, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !14, line: 51, type: !4)
!74 = !DILocation(line: 51, column: 12, scope: !72)
!75 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !14, line: 52, type: !4)
!76 = !DILocation(line: 52, column: 12, scope: !72)
!77 = !DILocation(line: 52, column: 33, scope: !72)
!78 = !DILocation(line: 53, column: 12, scope: !72)
!79 = !DILocation(line: 53, column: 5, scope: !72)
!80 = !DILocation(line: 54, column: 5, scope: !72)
!81 = !DILocation(line: 54, column: 23, scope: !72)
!82 = !DILocation(line: 55, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !72, file: !14, line: 55, column: 8)
!84 = !DILocation(line: 55, column: 8, scope: !72)
!85 = !DILocation(line: 58, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !14, line: 56, column: 5)
!87 = !DILocation(line: 59, column: 5, scope: !86)
!88 = !DILocation(line: 63, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !83, file: !14, line: 61, column: 5)
!90 = !DILocation(line: 63, column: 14, scope: !89)
!91 = !DILocalVariable(name: "dest", scope: !92, file: !14, line: 66, type: !36)
!92 = distinct !DILexicalBlock(scope: !72, file: !14, line: 65, column: 5)
!93 = !DILocation(line: 66, column: 14, scope: !92)
!94 = !DILocation(line: 67, column: 9, scope: !92)
!95 = !DILocation(line: 68, column: 9, scope: !92)
!96 = !DILocation(line: 68, column: 23, scope: !92)
!97 = !DILocation(line: 70, column: 16, scope: !92)
!98 = !DILocation(line: 70, column: 22, scope: !92)
!99 = !DILocation(line: 70, column: 9, scope: !92)
!100 = !DILocation(line: 71, column: 19, scope: !92)
!101 = !DILocation(line: 71, column: 9, scope: !92)
!102 = !DILocation(line: 73, column: 1, scope: !72)
!103 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 76, type: !15, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !14, line: 78, type: !4)
!105 = !DILocation(line: 78, column: 12, scope: !103)
!106 = !DILocalVariable(name: "dataBuffer", scope: !103, file: !14, line: 79, type: !4)
!107 = !DILocation(line: 79, column: 12, scope: !103)
!108 = !DILocation(line: 79, column: 33, scope: !103)
!109 = !DILocation(line: 80, column: 12, scope: !103)
!110 = !DILocation(line: 80, column: 5, scope: !103)
!111 = !DILocation(line: 81, column: 5, scope: !103)
!112 = !DILocation(line: 81, column: 23, scope: !103)
!113 = !DILocation(line: 82, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !103, file: !14, line: 82, column: 8)
!115 = !DILocation(line: 82, column: 8, scope: !103)
!116 = !DILocation(line: 85, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !14, line: 83, column: 5)
!118 = !DILocation(line: 85, column: 14, scope: !117)
!119 = !DILocation(line: 86, column: 5, scope: !117)
!120 = !DILocalVariable(name: "dest", scope: !121, file: !14, line: 88, type: !36)
!121 = distinct !DILexicalBlock(scope: !103, file: !14, line: 87, column: 5)
!122 = !DILocation(line: 88, column: 14, scope: !121)
!123 = !DILocation(line: 89, column: 9, scope: !121)
!124 = !DILocation(line: 90, column: 9, scope: !121)
!125 = !DILocation(line: 90, column: 23, scope: !121)
!126 = !DILocation(line: 92, column: 16, scope: !121)
!127 = !DILocation(line: 92, column: 22, scope: !121)
!128 = !DILocation(line: 92, column: 9, scope: !121)
!129 = !DILocation(line: 93, column: 19, scope: !121)
!130 = !DILocation(line: 93, column: 9, scope: !121)
!131 = !DILocation(line: 95, column: 1, scope: !103)
