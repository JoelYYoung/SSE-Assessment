; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_memcpy_10.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_memcpy_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_memcpy_10_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !24
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !25
  store i8 0, i8* %arrayidx, align 1, !dbg !26
  %0 = load i32, i32* @globalTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !30
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !32
  store i8* %add.ptr, i8** %data, align 8, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !35, metadata !DIExpression()), !dbg !37
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !38
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !39
  store i8 0, i8* %arrayidx3, align 1, !dbg !40
  %1 = load i8*, i8** %data, align 8, !dbg !41
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !42
  %2 = load i8*, i8** %data, align 8, !dbg !43
  %arrayidx5 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !43
  store i8 0, i8* %arrayidx5, align 1, !dbg !44
  %3 = load i8*, i8** %data, align 8, !dbg !45
  call void @printLine(i8* %3), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_memcpy_10_good() #0 !dbg !48 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #6, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #6, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE124_Buffer_Underwrite__char_declare_memcpy_10_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE124_Buffer_Underwrite__char_declare_memcpy_10_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !76
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !77
  store i8 0, i8* %arrayidx, align 1, !dbg !78
  %0 = load i32, i32* @globalFalse, align 4, !dbg !79
  %tobool = icmp ne i32 %0, 0, !dbg !79
  br i1 %tobool, label %if.then, label %if.else, !dbg !81

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !82
  br label %if.end, !dbg !84

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !85
  store i8* %arraydecay1, i8** %data, align 8, !dbg !87
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !88, metadata !DIExpression()), !dbg !90
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !91
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !92
  store i8 0, i8* %arrayidx3, align 1, !dbg !93
  %1 = load i8*, i8** %data, align 8, !dbg !94
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !95
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !95
  %2 = load i8*, i8** %data, align 8, !dbg !96
  %arrayidx5 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !96
  store i8 0, i8* %arrayidx5, align 1, !dbg !97
  %3 = load i8*, i8** %data, align 8, !dbg !98
  call void @printLine(i8* %3), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !106
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  %0 = load i32, i32* @globalTrue, align 4, !dbg !109
  %tobool = icmp ne i32 %0, 0, !dbg !109
  br i1 %tobool, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !112
  store i8* %arraydecay1, i8** %data, align 8, !dbg !114
  br label %if.end, !dbg !115

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !119
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !120
  store i8 0, i8* %arrayidx3, align 1, !dbg !121
  %1 = load i8*, i8** %data, align 8, !dbg !122
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !123
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !123
  %2 = load i8*, i8** %data, align 8, !dbg !124
  %arrayidx5 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !124
  store i8 0, i8* %arrayidx5, align 1, !dbg !125
  %3 = load i8*, i8** %data, align 8, !dbg !126
  call void @printLine(i8* %3), !dbg !127
  ret void, !dbg !128
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_memcpy_10.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_memcpy_10_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_memcpy_10.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocation(line: 27, column: 5, scope: !11)
!25 = !DILocation(line: 28, column: 5, scope: !11)
!26 = !DILocation(line: 28, column: 23, scope: !11)
!27 = !DILocation(line: 29, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 8)
!29 = !DILocation(line: 29, column: 8, scope: !11)
!30 = !DILocation(line: 32, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !12, line: 30, column: 5)
!32 = !DILocation(line: 32, column: 27, scope: !31)
!33 = !DILocation(line: 32, column: 14, scope: !31)
!34 = !DILocation(line: 33, column: 5, scope: !31)
!35 = !DILocalVariable(name: "source", scope: !36, file: !12, line: 35, type: !20)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!37 = !DILocation(line: 35, column: 14, scope: !36)
!38 = !DILocation(line: 36, column: 9, scope: !36)
!39 = !DILocation(line: 37, column: 9, scope: !36)
!40 = !DILocation(line: 37, column: 23, scope: !36)
!41 = !DILocation(line: 39, column: 16, scope: !36)
!42 = !DILocation(line: 39, column: 9, scope: !36)
!43 = !DILocation(line: 41, column: 9, scope: !36)
!44 = !DILocation(line: 41, column: 21, scope: !36)
!45 = !DILocation(line: 42, column: 19, scope: !36)
!46 = !DILocation(line: 42, column: 9, scope: !36)
!47 = !DILocation(line: 44, column: 1, scope: !11)
!48 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_memcpy_10_good", scope: !12, file: !12, line: 103, type: !13, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 105, column: 5, scope: !48)
!50 = !DILocation(line: 106, column: 5, scope: !48)
!51 = !DILocation(line: 107, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 119, type: !53, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !12, line: 119, type: !55)
!58 = !DILocation(line: 119, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !12, line: 119, type: !56)
!60 = !DILocation(line: 119, column: 27, scope: !52)
!61 = !DILocation(line: 122, column: 22, scope: !52)
!62 = !DILocation(line: 122, column: 12, scope: !52)
!63 = !DILocation(line: 122, column: 5, scope: !52)
!64 = !DILocation(line: 124, column: 5, scope: !52)
!65 = !DILocation(line: 125, column: 5, scope: !52)
!66 = !DILocation(line: 126, column: 5, scope: !52)
!67 = !DILocation(line: 129, column: 5, scope: !52)
!68 = !DILocation(line: 130, column: 5, scope: !52)
!69 = !DILocation(line: 131, column: 5, scope: !52)
!70 = !DILocation(line: 133, column: 5, scope: !52)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !12, line: 53, type: !16)
!73 = !DILocation(line: 53, column: 12, scope: !71)
!74 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !12, line: 54, type: !20)
!75 = !DILocation(line: 54, column: 10, scope: !71)
!76 = !DILocation(line: 55, column: 5, scope: !71)
!77 = !DILocation(line: 56, column: 5, scope: !71)
!78 = !DILocation(line: 56, column: 23, scope: !71)
!79 = !DILocation(line: 57, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !71, file: !12, line: 57, column: 8)
!81 = !DILocation(line: 57, column: 8, scope: !71)
!82 = !DILocation(line: 60, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !12, line: 58, column: 5)
!84 = !DILocation(line: 61, column: 5, scope: !83)
!85 = !DILocation(line: 65, column: 16, scope: !86)
!86 = distinct !DILexicalBlock(scope: !80, file: !12, line: 63, column: 5)
!87 = !DILocation(line: 65, column: 14, scope: !86)
!88 = !DILocalVariable(name: "source", scope: !89, file: !12, line: 68, type: !20)
!89 = distinct !DILexicalBlock(scope: !71, file: !12, line: 67, column: 5)
!90 = !DILocation(line: 68, column: 14, scope: !89)
!91 = !DILocation(line: 69, column: 9, scope: !89)
!92 = !DILocation(line: 70, column: 9, scope: !89)
!93 = !DILocation(line: 70, column: 23, scope: !89)
!94 = !DILocation(line: 72, column: 16, scope: !89)
!95 = !DILocation(line: 72, column: 9, scope: !89)
!96 = !DILocation(line: 74, column: 9, scope: !89)
!97 = !DILocation(line: 74, column: 21, scope: !89)
!98 = !DILocation(line: 75, column: 19, scope: !89)
!99 = !DILocation(line: 75, column: 9, scope: !89)
!100 = !DILocation(line: 77, column: 1, scope: !71)
!101 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 80, type: !13, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !12, line: 82, type: !16)
!103 = !DILocation(line: 82, column: 12, scope: !101)
!104 = !DILocalVariable(name: "dataBuffer", scope: !101, file: !12, line: 83, type: !20)
!105 = !DILocation(line: 83, column: 10, scope: !101)
!106 = !DILocation(line: 84, column: 5, scope: !101)
!107 = !DILocation(line: 85, column: 5, scope: !101)
!108 = !DILocation(line: 85, column: 23, scope: !101)
!109 = !DILocation(line: 86, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !101, file: !12, line: 86, column: 8)
!111 = !DILocation(line: 86, column: 8, scope: !101)
!112 = !DILocation(line: 89, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !12, line: 87, column: 5)
!114 = !DILocation(line: 89, column: 14, scope: !113)
!115 = !DILocation(line: 90, column: 5, scope: !113)
!116 = !DILocalVariable(name: "source", scope: !117, file: !12, line: 92, type: !20)
!117 = distinct !DILexicalBlock(scope: !101, file: !12, line: 91, column: 5)
!118 = !DILocation(line: 92, column: 14, scope: !117)
!119 = !DILocation(line: 93, column: 9, scope: !117)
!120 = !DILocation(line: 94, column: 9, scope: !117)
!121 = !DILocation(line: 94, column: 23, scope: !117)
!122 = !DILocation(line: 96, column: 16, scope: !117)
!123 = !DILocation(line: 96, column: 9, scope: !117)
!124 = !DILocation(line: 98, column: 9, scope: !117)
!125 = !DILocation(line: 98, column: 21, scope: !117)
!126 = !DILocation(line: 99, column: 19, scope: !117)
!127 = !DILocation(line: 99, column: 9, scope: !117)
!128 = !DILocation(line: 101, column: 1, scope: !101)
