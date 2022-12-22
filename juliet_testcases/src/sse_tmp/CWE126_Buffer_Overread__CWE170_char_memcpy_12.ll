; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_12.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_memcpy_12_bad() #0 !dbg !11 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %data4 = alloca [150 x i8], align 16
  %dest5 = alloca [100 x i8], align 16
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !15
  %tobool = icmp ne i32 %call, 0, !dbg !15
  br i1 %tobool, label %if.then, label %if.else, !dbg !17

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !18, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !31
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !34
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !34
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 16 %arraydecay2, i64 99, i1 false), !dbg !34
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !35
  call void @printLine(i8* %arraydecay3), !dbg !36
  br label %if.end, !dbg !37

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data4, metadata !38, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest5, metadata !42, metadata !DIExpression()), !dbg !43
  %arraydecay6 = getelementptr inbounds [150 x i8], [150 x i8]* %data4, i64 0, i64 0, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay6, i8 65, i64 149, i1 false), !dbg !44
  %arrayidx7 = getelementptr inbounds [150 x i8], [150 x i8]* %data4, i64 0, i64 149, !dbg !45
  store i8 0, i8* %arrayidx7, align 1, !dbg !46
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest5, i64 0, i64 0, !dbg !47
  %arraydecay9 = getelementptr inbounds [150 x i8], [150 x i8]* %data4, i64 0, i64 0, !dbg !47
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay8, i8* align 16 %arraydecay9, i64 99, i1 false), !dbg !47
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest5, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx10, align 1, !dbg !49
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest5, i64 0, i64 0, !dbg !50
  call void @printLine(i8* %arraydecay11), !dbg !51
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !52
}

declare dso_local i32 @globalReturnsTrueOrFalse(...) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_memcpy_12_good() #0 !dbg !53 {
entry:
  call void @good1(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #6, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #6, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE126_Buffer_Overread__CWE170_char_memcpy_12_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE126_Buffer_Overread__CWE170_char_memcpy_12_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !76 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %data5 = alloca [150 x i8], align 16
  %dest6 = alloca [100 x i8], align 16
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !77
  %tobool = icmp ne i32 %call, 0, !dbg !77
  br i1 %tobool, label %if.then, label %if.else, !dbg !79

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !80, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !84, metadata !DIExpression()), !dbg !85
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !86
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !87
  store i8 0, i8* %arrayidx, align 1, !dbg !88
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !89
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !89
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 16 %arraydecay2, i64 99, i1 false), !dbg !89
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !90
  store i8 0, i8* %arrayidx3, align 1, !dbg !91
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !92
  call void @printLine(i8* %arraydecay4), !dbg !93
  br label %if.end, !dbg !94

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data5, metadata !95, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest6, metadata !99, metadata !DIExpression()), !dbg !100
  %arraydecay7 = getelementptr inbounds [150 x i8], [150 x i8]* %data5, i64 0, i64 0, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay7, i8 65, i64 149, i1 false), !dbg !101
  %arrayidx8 = getelementptr inbounds [150 x i8], [150 x i8]* %data5, i64 0, i64 149, !dbg !102
  store i8 0, i8* %arrayidx8, align 1, !dbg !103
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest6, i64 0, i64 0, !dbg !104
  %arraydecay10 = getelementptr inbounds [150 x i8], [150 x i8]* %data5, i64 0, i64 0, !dbg !104
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay9, i8* align 16 %arraydecay10, i64 99, i1 false), !dbg !104
  %arrayidx11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest6, i64 0, i64 99, !dbg !105
  store i8 0, i8* %arrayidx11, align 1, !dbg !106
  %arraydecay12 = getelementptr inbounds [100 x i8], [100 x i8]* %dest6, i64 0, i64 0, !dbg !107
  call void @printLine(i8* %arraydecay12), !dbg !108
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !109
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_memcpy_12_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_12.c", directory: "/root/SSE-Assessment")
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
!34 = !DILocation(line: 31, column: 13, scope: !19)
!35 = !DILocation(line: 33, column: 23, scope: !19)
!36 = !DILocation(line: 33, column: 13, scope: !19)
!37 = !DILocation(line: 35, column: 5, scope: !20)
!38 = !DILocalVariable(name: "data", scope: !39, file: !12, line: 39, type: !21)
!39 = distinct !DILexicalBlock(scope: !40, file: !12, line: 38, column: 9)
!40 = distinct !DILexicalBlock(scope: !16, file: !12, line: 37, column: 5)
!41 = !DILocation(line: 39, column: 18, scope: !39)
!42 = !DILocalVariable(name: "dest", scope: !39, file: !12, line: 39, type: !27)
!43 = !DILocation(line: 39, column: 29, scope: !39)
!44 = !DILocation(line: 41, column: 13, scope: !39)
!45 = !DILocation(line: 42, column: 13, scope: !39)
!46 = !DILocation(line: 42, column: 23, scope: !39)
!47 = !DILocation(line: 43, column: 13, scope: !39)
!48 = !DILocation(line: 44, column: 13, scope: !39)
!49 = !DILocation(line: 44, column: 22, scope: !39)
!50 = !DILocation(line: 45, column: 23, scope: !39)
!51 = !DILocation(line: 45, column: 13, scope: !39)
!52 = !DILocation(line: 48, column: 1, scope: !11)
!53 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_memcpy_12_good", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 85, column: 5, scope: !53)
!55 = !DILocation(line: 86, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 97, type: !57, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 97, type: !59)
!63 = !DILocation(line: 97, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 97, type: !60)
!65 = !DILocation(line: 97, column: 27, scope: !56)
!66 = !DILocation(line: 100, column: 22, scope: !56)
!67 = !DILocation(line: 100, column: 12, scope: !56)
!68 = !DILocation(line: 100, column: 5, scope: !56)
!69 = !DILocation(line: 102, column: 5, scope: !56)
!70 = !DILocation(line: 103, column: 5, scope: !56)
!71 = !DILocation(line: 104, column: 5, scope: !56)
!72 = !DILocation(line: 107, column: 5, scope: !56)
!73 = !DILocation(line: 108, column: 5, scope: !56)
!74 = !DILocation(line: 109, column: 5, scope: !56)
!75 = !DILocation(line: 111, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 57, column: 8, scope: !78)
!78 = distinct !DILexicalBlock(scope: !76, file: !12, line: 57, column: 8)
!79 = !DILocation(line: 57, column: 8, scope: !76)
!80 = !DILocalVariable(name: "data", scope: !81, file: !12, line: 60, type: !21)
!81 = distinct !DILexicalBlock(scope: !82, file: !12, line: 59, column: 9)
!82 = distinct !DILexicalBlock(scope: !78, file: !12, line: 58, column: 5)
!83 = !DILocation(line: 60, column: 18, scope: !81)
!84 = !DILocalVariable(name: "dest", scope: !81, file: !12, line: 60, type: !27)
!85 = !DILocation(line: 60, column: 29, scope: !81)
!86 = !DILocation(line: 62, column: 13, scope: !81)
!87 = !DILocation(line: 63, column: 13, scope: !81)
!88 = !DILocation(line: 63, column: 23, scope: !81)
!89 = !DILocation(line: 64, column: 13, scope: !81)
!90 = !DILocation(line: 65, column: 13, scope: !81)
!91 = !DILocation(line: 65, column: 22, scope: !81)
!92 = !DILocation(line: 66, column: 23, scope: !81)
!93 = !DILocation(line: 66, column: 13, scope: !81)
!94 = !DILocation(line: 68, column: 5, scope: !82)
!95 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 72, type: !21)
!96 = distinct !DILexicalBlock(scope: !97, file: !12, line: 71, column: 9)
!97 = distinct !DILexicalBlock(scope: !78, file: !12, line: 70, column: 5)
!98 = !DILocation(line: 72, column: 18, scope: !96)
!99 = !DILocalVariable(name: "dest", scope: !96, file: !12, line: 72, type: !27)
!100 = !DILocation(line: 72, column: 29, scope: !96)
!101 = !DILocation(line: 74, column: 13, scope: !96)
!102 = !DILocation(line: 75, column: 13, scope: !96)
!103 = !DILocation(line: 75, column: 23, scope: !96)
!104 = !DILocation(line: 76, column: 13, scope: !96)
!105 = !DILocation(line: 77, column: 13, scope: !96)
!106 = !DILocation(line: 77, column: 22, scope: !96)
!107 = !DILocation(line: 78, column: 23, scope: !96)
!108 = !DILocation(line: 78, column: 13, scope: !96)
!109 = !DILocation(line: 81, column: 1, scope: !76)
