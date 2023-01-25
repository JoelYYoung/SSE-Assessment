; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_11.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_strncpy_11_bad() #0 !dbg !11 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %call = call i32 (...) @globalReturnsTrue(), !dbg !15
  %tobool = icmp ne i32 %call, 0, !dbg !15
  br i1 %tobool, label %if.then, label %if.end, !dbg !17

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !18, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !31
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !34
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !35
  %call3 = call i8* @strncpy(i8* %arraydecay1, i8* %arraydecay2, i64 99) #5, !dbg !36
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !37
  call void @printLine(i8* %arraydecay4), !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !40
}

declare dso_local i32 @globalReturnsTrue(...) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #4

declare dso_local void @printLine(i8*) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_strncpy_11_good() #0 !dbg !41 {
entry:
  call void @good1(), !dbg !42
  call void @good2(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #5, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #5, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE126_Buffer_Overread__CWE170_char_strncpy_11_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE126_Buffer_Overread__CWE170_char_strncpy_11_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !65 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %call = call i32 (...) @globalReturnsFalse(), !dbg !66
  %tobool = icmp ne i32 %call, 0, !dbg !66
  br i1 %tobool, label %if.then, label %if.else, !dbg !68

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !69
  br label %if.end, !dbg !71

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !72, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !76, metadata !DIExpression()), !dbg !77
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !78
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !78
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !79
  store i8 0, i8* %arrayidx, align 1, !dbg !80
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !81
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !82
  %call3 = call i8* @strncpy(i8* %arraydecay1, i8* %arraydecay2, i64 99) #5, !dbg !83
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !84
  store i8 0, i8* %arrayidx4, align 1, !dbg !85
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !86
  call void @printLine(i8* %arraydecay5), !dbg !87
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !88
}

declare dso_local i32 @globalReturnsFalse(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !89 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %call = call i32 (...) @globalReturnsTrue(), !dbg !90
  %tobool = icmp ne i32 %call, 0, !dbg !90
  br i1 %tobool, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !93, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !97, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !99
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !102
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !103
  %call3 = call i8* @strncpy(i8* %arraydecay1, i8* %arraydecay2, i64 99) #5, !dbg !104
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !105
  store i8 0, i8* %arrayidx4, align 1, !dbg !106
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !107
  call void @printLine(i8* %arraydecay5), !dbg !108
  br label %if.end, !dbg !109

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !110
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_11.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_strncpy_11_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_11.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 24, column: 8, scope: !16)
!16 = distinct !DILexicalBlock(scope: !11, file: !12, line: 24, column: 8)
!17 = !DILocation(line: 24, column: 8, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 27, type: !21)
!19 = distinct !DILexicalBlock(scope: !20, file: !12, line: 26, column: 9)
!20 = distinct !DILexicalBlock(scope: !16, file: !12, line: 25, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 1200, elements: !23)
!22 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!23 = !{!24}
!24 = !DISubrange(count: 150)
!25 = !DILocation(line: 27, column: 18, scope: !19)
!26 = !DILocalVariable(name: "dest", scope: !19, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 800, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 29, scope: !19)
!31 = !DILocation(line: 29, column: 13, scope: !19)
!32 = !DILocation(line: 30, column: 13, scope: !19)
!33 = !DILocation(line: 30, column: 23, scope: !19)
!34 = !DILocation(line: 33, column: 21, scope: !19)
!35 = !DILocation(line: 33, column: 27, scope: !19)
!36 = !DILocation(line: 33, column: 13, scope: !19)
!37 = !DILocation(line: 35, column: 23, scope: !19)
!38 = !DILocation(line: 35, column: 13, scope: !19)
!39 = !DILocation(line: 37, column: 5, scope: !20)
!40 = !DILocation(line: 38, column: 1, scope: !11)
!41 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_strncpy_11_good", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 89, column: 5, scope: !41)
!43 = !DILocation(line: 90, column: 5, scope: !41)
!44 = !DILocation(line: 91, column: 1, scope: !41)
!45 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 102, type: !46, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!48, !48, !49}
!48 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !12, line: 102, type: !48)
!52 = !DILocation(line: 102, column: 14, scope: !45)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !12, line: 102, type: !49)
!54 = !DILocation(line: 102, column: 27, scope: !45)
!55 = !DILocation(line: 105, column: 22, scope: !45)
!56 = !DILocation(line: 105, column: 12, scope: !45)
!57 = !DILocation(line: 105, column: 5, scope: !45)
!58 = !DILocation(line: 107, column: 5, scope: !45)
!59 = !DILocation(line: 108, column: 5, scope: !45)
!60 = !DILocation(line: 109, column: 5, scope: !45)
!61 = !DILocation(line: 112, column: 5, scope: !45)
!62 = !DILocation(line: 113, column: 5, scope: !45)
!63 = !DILocation(line: 114, column: 5, scope: !45)
!64 = !DILocation(line: 116, column: 5, scope: !45)
!65 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 45, type: !13, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 47, column: 8, scope: !67)
!67 = distinct !DILexicalBlock(scope: !65, file: !12, line: 47, column: 8)
!68 = !DILocation(line: 47, column: 8, scope: !65)
!69 = !DILocation(line: 50, column: 9, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !12, line: 48, column: 5)
!71 = !DILocation(line: 51, column: 5, scope: !70)
!72 = !DILocalVariable(name: "data", scope: !73, file: !12, line: 55, type: !21)
!73 = distinct !DILexicalBlock(scope: !74, file: !12, line: 54, column: 9)
!74 = distinct !DILexicalBlock(scope: !67, file: !12, line: 53, column: 5)
!75 = !DILocation(line: 55, column: 18, scope: !73)
!76 = !DILocalVariable(name: "dest", scope: !73, file: !12, line: 55, type: !27)
!77 = !DILocation(line: 55, column: 29, scope: !73)
!78 = !DILocation(line: 57, column: 13, scope: !73)
!79 = !DILocation(line: 58, column: 13, scope: !73)
!80 = !DILocation(line: 58, column: 23, scope: !73)
!81 = !DILocation(line: 61, column: 21, scope: !73)
!82 = !DILocation(line: 61, column: 27, scope: !73)
!83 = !DILocation(line: 61, column: 13, scope: !73)
!84 = !DILocation(line: 62, column: 13, scope: !73)
!85 = !DILocation(line: 62, column: 22, scope: !73)
!86 = !DILocation(line: 63, column: 23, scope: !73)
!87 = !DILocation(line: 63, column: 13, scope: !73)
!88 = !DILocation(line: 66, column: 1, scope: !65)
!89 = distinct !DISubprogram(name: "good2", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocation(line: 71, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !89, file: !12, line: 71, column: 8)
!92 = !DILocation(line: 71, column: 8, scope: !89)
!93 = !DILocalVariable(name: "data", scope: !94, file: !12, line: 74, type: !21)
!94 = distinct !DILexicalBlock(scope: !95, file: !12, line: 73, column: 9)
!95 = distinct !DILexicalBlock(scope: !91, file: !12, line: 72, column: 5)
!96 = !DILocation(line: 74, column: 18, scope: !94)
!97 = !DILocalVariable(name: "dest", scope: !94, file: !12, line: 74, type: !27)
!98 = !DILocation(line: 74, column: 29, scope: !94)
!99 = !DILocation(line: 76, column: 13, scope: !94)
!100 = !DILocation(line: 77, column: 13, scope: !94)
!101 = !DILocation(line: 77, column: 23, scope: !94)
!102 = !DILocation(line: 80, column: 21, scope: !94)
!103 = !DILocation(line: 80, column: 27, scope: !94)
!104 = !DILocation(line: 80, column: 13, scope: !94)
!105 = !DILocation(line: 81, column: 13, scope: !94)
!106 = !DILocation(line: 81, column: 22, scope: !94)
!107 = !DILocation(line: 82, column: 23, scope: !94)
!108 = !DILocation(line: 82, column: 13, scope: !94)
!109 = !DILocation(line: 84, column: 5, scope: !95)
!110 = !DILocation(line: 85, column: 1, scope: !89)
