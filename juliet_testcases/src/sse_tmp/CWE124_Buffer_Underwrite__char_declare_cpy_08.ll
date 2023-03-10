; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_cpy_08.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_cpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_cpy_08_bad() #0 !dbg !11 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
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
  %0 = load i8*, i8** %data, align 8, !dbg !41
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !42
  %call5 = call i8* @strcpy(i8* %0, i8* %arraydecay4) #5, !dbg !43
  %1 = load i8*, i8** %data, align 8, !dbg !44
  call void @printLine(i8* %1), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_cpy_08_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #5, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #5, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE124_Buffer_Underwrite__char_declare_cpy_08_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE124_Buffer_Underwrite__char_declare_cpy_08_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !70 {
entry:
  ret i32 1, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !79
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !80
  store i8 0, i8* %arrayidx, align 1, !dbg !81
  %call = call i32 @staticReturnsFalse(), !dbg !82
  %tobool = icmp ne i32 %call, 0, !dbg !82
  br i1 %tobool, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  br label %if.end, !dbg !87

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !88
  store i8* %arraydecay1, i8** %data, align 8, !dbg !90
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !91, metadata !DIExpression()), !dbg !93
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !94
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !95
  store i8 0, i8* %arrayidx3, align 1, !dbg !96
  %0 = load i8*, i8** %data, align 8, !dbg !97
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !98
  %call5 = call i8* @strcpy(i8* %0, i8* %arraydecay4) #5, !dbg !99
  %1 = load i8*, i8** %data, align 8, !dbg !100
  call void @printLine(i8* %1), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !103 {
entry:
  ret i32 0, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !105 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !110
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !111
  store i8 0, i8* %arrayidx, align 1, !dbg !112
  %call = call i32 @staticReturnsTrue(), !dbg !113
  %tobool = icmp ne i32 %call, 0, !dbg !113
  br i1 %tobool, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !116
  store i8* %arraydecay1, i8** %data, align 8, !dbg !118
  br label %if.end, !dbg !119

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !123
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !124
  store i8 0, i8* %arrayidx3, align 1, !dbg !125
  %0 = load i8*, i8** %data, align 8, !dbg !126
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !127
  %call5 = call i8* @strcpy(i8* %0, i8* %arraydecay4) #5, !dbg !128
  %1 = load i8*, i8** %data, align 8, !dbg !129
  call void @printLine(i8* %1), !dbg !130
  ret void, !dbg !131
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_cpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_cpy_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_cpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 39, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 40, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 40, column: 10, scope: !11)
!24 = !DILocation(line: 41, column: 5, scope: !11)
!25 = !DILocation(line: 42, column: 5, scope: !11)
!26 = !DILocation(line: 42, column: 23, scope: !11)
!27 = !DILocation(line: 43, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !11, file: !12, line: 43, column: 8)
!29 = !DILocation(line: 43, column: 8, scope: !11)
!30 = !DILocation(line: 46, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !12, line: 44, column: 5)
!32 = !DILocation(line: 46, column: 27, scope: !31)
!33 = !DILocation(line: 46, column: 14, scope: !31)
!34 = !DILocation(line: 47, column: 5, scope: !31)
!35 = !DILocalVariable(name: "source", scope: !36, file: !12, line: 49, type: !20)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 48, column: 5)
!37 = !DILocation(line: 49, column: 14, scope: !36)
!38 = !DILocation(line: 50, column: 9, scope: !36)
!39 = !DILocation(line: 51, column: 9, scope: !36)
!40 = !DILocation(line: 51, column: 23, scope: !36)
!41 = !DILocation(line: 53, column: 16, scope: !36)
!42 = !DILocation(line: 53, column: 22, scope: !36)
!43 = !DILocation(line: 53, column: 9, scope: !36)
!44 = !DILocation(line: 54, column: 19, scope: !36)
!45 = !DILocation(line: 54, column: 9, scope: !36)
!46 = !DILocation(line: 56, column: 1, scope: !11)
!47 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_cpy_08_good", scope: !12, file: !12, line: 111, type: !13, scopeLine: 112, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 113, column: 5, scope: !47)
!49 = !DILocation(line: 114, column: 5, scope: !47)
!50 = !DILocation(line: 115, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 127, type: !52, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !12, line: 127, type: !54)
!57 = !DILocation(line: 127, column: 14, scope: !51)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !12, line: 127, type: !55)
!59 = !DILocation(line: 127, column: 27, scope: !51)
!60 = !DILocation(line: 130, column: 22, scope: !51)
!61 = !DILocation(line: 130, column: 12, scope: !51)
!62 = !DILocation(line: 130, column: 5, scope: !51)
!63 = !DILocation(line: 132, column: 5, scope: !51)
!64 = !DILocation(line: 133, column: 5, scope: !51)
!65 = !DILocation(line: 134, column: 5, scope: !51)
!66 = !DILocation(line: 137, column: 5, scope: !51)
!67 = !DILocation(line: 138, column: 5, scope: !51)
!68 = !DILocation(line: 139, column: 5, scope: !51)
!69 = !DILocation(line: 141, column: 5, scope: !51)
!70 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !71, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!54}
!73 = !DILocation(line: 27, column: 5, scope: !70)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 63, type: !13, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !12, line: 65, type: !16)
!76 = !DILocation(line: 65, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !12, line: 66, type: !20)
!78 = !DILocation(line: 66, column: 10, scope: !74)
!79 = !DILocation(line: 67, column: 5, scope: !74)
!80 = !DILocation(line: 68, column: 5, scope: !74)
!81 = !DILocation(line: 68, column: 23, scope: !74)
!82 = !DILocation(line: 69, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !74, file: !12, line: 69, column: 8)
!84 = !DILocation(line: 69, column: 8, scope: !74)
!85 = !DILocation(line: 72, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !12, line: 70, column: 5)
!87 = !DILocation(line: 73, column: 5, scope: !86)
!88 = !DILocation(line: 77, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !83, file: !12, line: 75, column: 5)
!90 = !DILocation(line: 77, column: 14, scope: !89)
!91 = !DILocalVariable(name: "source", scope: !92, file: !12, line: 80, type: !20)
!92 = distinct !DILexicalBlock(scope: !74, file: !12, line: 79, column: 5)
!93 = !DILocation(line: 80, column: 14, scope: !92)
!94 = !DILocation(line: 81, column: 9, scope: !92)
!95 = !DILocation(line: 82, column: 9, scope: !92)
!96 = !DILocation(line: 82, column: 23, scope: !92)
!97 = !DILocation(line: 84, column: 16, scope: !92)
!98 = !DILocation(line: 84, column: 22, scope: !92)
!99 = !DILocation(line: 84, column: 9, scope: !92)
!100 = !DILocation(line: 85, column: 19, scope: !92)
!101 = !DILocation(line: 85, column: 9, scope: !92)
!102 = !DILocation(line: 87, column: 1, scope: !74)
!103 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !71, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocation(line: 32, column: 5, scope: !103)
!105 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 90, type: !13, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !12, line: 92, type: !16)
!107 = !DILocation(line: 92, column: 12, scope: !105)
!108 = !DILocalVariable(name: "dataBuffer", scope: !105, file: !12, line: 93, type: !20)
!109 = !DILocation(line: 93, column: 10, scope: !105)
!110 = !DILocation(line: 94, column: 5, scope: !105)
!111 = !DILocation(line: 95, column: 5, scope: !105)
!112 = !DILocation(line: 95, column: 23, scope: !105)
!113 = !DILocation(line: 96, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !105, file: !12, line: 96, column: 8)
!115 = !DILocation(line: 96, column: 8, scope: !105)
!116 = !DILocation(line: 99, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !12, line: 97, column: 5)
!118 = !DILocation(line: 99, column: 14, scope: !117)
!119 = !DILocation(line: 100, column: 5, scope: !117)
!120 = !DILocalVariable(name: "source", scope: !121, file: !12, line: 102, type: !20)
!121 = distinct !DILexicalBlock(scope: !105, file: !12, line: 101, column: 5)
!122 = !DILocation(line: 102, column: 14, scope: !121)
!123 = !DILocation(line: 103, column: 9, scope: !121)
!124 = !DILocation(line: 104, column: 9, scope: !121)
!125 = !DILocation(line: 104, column: 23, scope: !121)
!126 = !DILocation(line: 106, column: 16, scope: !121)
!127 = !DILocation(line: 106, column: 22, scope: !121)
!128 = !DILocation(line: 106, column: 9, scope: !121)
!129 = !DILocation(line: 107, column: 19, scope: !121)
!130 = !DILocation(line: 107, column: 9, scope: !121)
!131 = !DILocation(line: 109, column: 1, scope: !105)
