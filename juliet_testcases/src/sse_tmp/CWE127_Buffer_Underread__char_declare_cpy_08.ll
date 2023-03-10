; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_08.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_cpy_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [200 x i8], align 16
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
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 199, i1 false), !dbg !41
  %arrayidx3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !42
  store i8 0, i8* %arrayidx3, align 1, !dbg !43
  %arraydecay4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !44
  %0 = load i8*, i8** %data, align 8, !dbg !45
  %call5 = call i8* @strcpy(i8* %arraydecay4, i8* %0) #5, !dbg !46
  %arraydecay6 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !47
  call void @printLine(i8* %arraydecay6), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_cpy_08_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #5, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #5, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE127_Buffer_Underread__char_declare_cpy_08_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE127_Buffer_Underread__char_declare_cpy_08_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !73 {
entry:
  ret i32 1, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !82
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  %call = call i32 @staticReturnsFalse(), !dbg !85
  %tobool = icmp ne i32 %call, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end, !dbg !90

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !91
  store i8* %arraydecay1, i8** %data, align 8, !dbg !93
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !94, metadata !DIExpression()), !dbg !96
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 199, i1 false), !dbg !97
  %arrayidx3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !98
  store i8 0, i8* %arrayidx3, align 1, !dbg !99
  %arraydecay4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !100
  %0 = load i8*, i8** %data, align 8, !dbg !101
  %call5 = call i8* @strcpy(i8* %arraydecay4, i8* %0) #5, !dbg !102
  %arraydecay6 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !103
  call void @printLine(i8* %arraydecay6), !dbg !104
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
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !113
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  %call = call i32 @staticReturnsTrue(), !dbg !116
  %tobool = icmp ne i32 %call, 0, !dbg !116
  br i1 %tobool, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !119
  store i8* %arraydecay1, i8** %data, align 8, !dbg !121
  br label %if.end, !dbg !122

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !123, metadata !DIExpression()), !dbg !125
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 199, i1 false), !dbg !126
  %arrayidx3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !127
  store i8 0, i8* %arrayidx3, align 1, !dbg !128
  %arraydecay4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !129
  %0 = load i8*, i8** %data, align 8, !dbg !130
  %call5 = call i8* @strcpy(i8* %arraydecay4, i8* %0) #5, !dbg !131
  %arraydecay6 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !132
  call void @printLine(i8* %arraydecay6), !dbg !133
  ret void, !dbg !134
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_cpy_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!35 = !DILocalVariable(name: "dest", scope: !36, file: !12, line: 49, type: !37)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 48, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 200)
!40 = !DILocation(line: 49, column: 14, scope: !36)
!41 = !DILocation(line: 50, column: 9, scope: !36)
!42 = !DILocation(line: 51, column: 9, scope: !36)
!43 = !DILocation(line: 51, column: 23, scope: !36)
!44 = !DILocation(line: 53, column: 16, scope: !36)
!45 = !DILocation(line: 53, column: 22, scope: !36)
!46 = !DILocation(line: 53, column: 9, scope: !36)
!47 = !DILocation(line: 54, column: 19, scope: !36)
!48 = !DILocation(line: 54, column: 9, scope: !36)
!49 = !DILocation(line: 56, column: 1, scope: !11)
!50 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_cpy_08_good", scope: !12, file: !12, line: 111, type: !13, scopeLine: 112, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 113, column: 5, scope: !50)
!52 = !DILocation(line: 114, column: 5, scope: !50)
!53 = !DILocation(line: 115, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 127, type: !55, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !12, line: 127, type: !57)
!60 = !DILocation(line: 127, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !12, line: 127, type: !58)
!62 = !DILocation(line: 127, column: 27, scope: !54)
!63 = !DILocation(line: 130, column: 22, scope: !54)
!64 = !DILocation(line: 130, column: 12, scope: !54)
!65 = !DILocation(line: 130, column: 5, scope: !54)
!66 = !DILocation(line: 132, column: 5, scope: !54)
!67 = !DILocation(line: 133, column: 5, scope: !54)
!68 = !DILocation(line: 134, column: 5, scope: !54)
!69 = !DILocation(line: 137, column: 5, scope: !54)
!70 = !DILocation(line: 138, column: 5, scope: !54)
!71 = !DILocation(line: 139, column: 5, scope: !54)
!72 = !DILocation(line: 141, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !74, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!57}
!76 = !DILocation(line: 27, column: 5, scope: !73)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 63, type: !13, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !12, line: 65, type: !16)
!79 = !DILocation(line: 65, column: 12, scope: !77)
!80 = !DILocalVariable(name: "dataBuffer", scope: !77, file: !12, line: 66, type: !20)
!81 = !DILocation(line: 66, column: 10, scope: !77)
!82 = !DILocation(line: 67, column: 5, scope: !77)
!83 = !DILocation(line: 68, column: 5, scope: !77)
!84 = !DILocation(line: 68, column: 23, scope: !77)
!85 = !DILocation(line: 69, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !77, file: !12, line: 69, column: 8)
!87 = !DILocation(line: 69, column: 8, scope: !77)
!88 = !DILocation(line: 72, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !12, line: 70, column: 5)
!90 = !DILocation(line: 73, column: 5, scope: !89)
!91 = !DILocation(line: 77, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !12, line: 75, column: 5)
!93 = !DILocation(line: 77, column: 14, scope: !92)
!94 = !DILocalVariable(name: "dest", scope: !95, file: !12, line: 80, type: !37)
!95 = distinct !DILexicalBlock(scope: !77, file: !12, line: 79, column: 5)
!96 = !DILocation(line: 80, column: 14, scope: !95)
!97 = !DILocation(line: 81, column: 9, scope: !95)
!98 = !DILocation(line: 82, column: 9, scope: !95)
!99 = !DILocation(line: 82, column: 23, scope: !95)
!100 = !DILocation(line: 84, column: 16, scope: !95)
!101 = !DILocation(line: 84, column: 22, scope: !95)
!102 = !DILocation(line: 84, column: 9, scope: !95)
!103 = !DILocation(line: 85, column: 19, scope: !95)
!104 = !DILocation(line: 85, column: 9, scope: !95)
!105 = !DILocation(line: 87, column: 1, scope: !77)
!106 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !74, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocation(line: 32, column: 5, scope: !106)
!108 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 90, type: !13, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !12, line: 92, type: !16)
!110 = !DILocation(line: 92, column: 12, scope: !108)
!111 = !DILocalVariable(name: "dataBuffer", scope: !108, file: !12, line: 93, type: !20)
!112 = !DILocation(line: 93, column: 10, scope: !108)
!113 = !DILocation(line: 94, column: 5, scope: !108)
!114 = !DILocation(line: 95, column: 5, scope: !108)
!115 = !DILocation(line: 95, column: 23, scope: !108)
!116 = !DILocation(line: 96, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !108, file: !12, line: 96, column: 8)
!118 = !DILocation(line: 96, column: 8, scope: !108)
!119 = !DILocation(line: 99, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !12, line: 97, column: 5)
!121 = !DILocation(line: 99, column: 14, scope: !120)
!122 = !DILocation(line: 100, column: 5, scope: !120)
!123 = !DILocalVariable(name: "dest", scope: !124, file: !12, line: 102, type: !37)
!124 = distinct !DILexicalBlock(scope: !108, file: !12, line: 101, column: 5)
!125 = !DILocation(line: 102, column: 14, scope: !124)
!126 = !DILocation(line: 103, column: 9, scope: !124)
!127 = !DILocation(line: 104, column: 9, scope: !124)
!128 = !DILocation(line: 104, column: 23, scope: !124)
!129 = !DILocation(line: 106, column: 16, scope: !124)
!130 = !DILocation(line: 106, column: 22, scope: !124)
!131 = !DILocation(line: 106, column: 9, scope: !124)
!132 = !DILocation(line: 107, column: 19, scope: !124)
!133 = !DILocation(line: 107, column: 9, scope: !124)
!134 = !DILocation(line: 109, column: 1, scope: !108)
