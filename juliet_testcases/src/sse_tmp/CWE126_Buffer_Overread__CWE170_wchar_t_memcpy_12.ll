; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_12.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_12_bad() #0 !dbg !11 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %data5 = alloca [150 x i32], align 16
  %dest6 = alloca [100 x i32], align 16
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !15
  %tobool = icmp ne i32 %call, 0, !dbg !15
  br i1 %tobool, label %if.then, label %if.else, !dbg !17

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !18, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !33
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !34
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !37
  %0 = bitcast i32* %arraydecay2 to i8*, !dbg !37
  %arraydecay3 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !37
  %1 = bitcast i32* %arraydecay3 to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 %1, i64 396, i1 false), !dbg !37
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !38
  call void @printWLine(i32* %arraydecay4), !dbg !39
  br label %if.end, !dbg !40

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data5, metadata !41, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest6, metadata !45, metadata !DIExpression()), !dbg !46
  %arraydecay7 = getelementptr inbounds [150 x i32], [150 x i32]* %data5, i64 0, i64 0, !dbg !47
  %call8 = call i32* @wmemset(i32* %arraydecay7, i32 65, i64 149) #5, !dbg !48
  %arrayidx9 = getelementptr inbounds [150 x i32], [150 x i32]* %data5, i64 0, i64 149, !dbg !49
  store i32 0, i32* %arrayidx9, align 4, !dbg !50
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest6, i64 0, i64 0, !dbg !51
  %2 = bitcast i32* %arraydecay10 to i8*, !dbg !51
  %arraydecay11 = getelementptr inbounds [150 x i32], [150 x i32]* %data5, i64 0, i64 0, !dbg !51
  %3 = bitcast i32* %arraydecay11 to i8*, !dbg !51
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 %3, i64 396, i1 false), !dbg !51
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest6, i64 0, i64 99, !dbg !52
  store i32 0, i32* %arrayidx12, align 4, !dbg !53
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest6, i64 0, i64 0, !dbg !54
  call void @printWLine(i32* %arraydecay13), !dbg !55
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !56
}

declare dso_local i32 @globalReturnsTrueOrFalse(...) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_12_good() #0 !dbg !57 {
entry:
  call void @good1(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #5, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #5, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_12_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_12_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !80 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %data6 = alloca [150 x i32], align 16
  %dest7 = alloca [100 x i32], align 16
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !81
  %tobool = icmp ne i32 %call, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !84, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !88, metadata !DIExpression()), !dbg !89
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !90
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !91
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !92
  store i32 0, i32* %arrayidx, align 4, !dbg !93
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !94
  %0 = bitcast i32* %arraydecay2 to i8*, !dbg !94
  %arraydecay3 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !94
  %1 = bitcast i32* %arraydecay3 to i8*, !dbg !94
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 %1, i64 396, i1 false), !dbg !94
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !95
  store i32 0, i32* %arrayidx4, align 4, !dbg !96
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !97
  call void @printWLine(i32* %arraydecay5), !dbg !98
  br label %if.end, !dbg !99

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data6, metadata !100, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest7, metadata !104, metadata !DIExpression()), !dbg !105
  %arraydecay8 = getelementptr inbounds [150 x i32], [150 x i32]* %data6, i64 0, i64 0, !dbg !106
  %call9 = call i32* @wmemset(i32* %arraydecay8, i32 65, i64 149) #5, !dbg !107
  %arrayidx10 = getelementptr inbounds [150 x i32], [150 x i32]* %data6, i64 0, i64 149, !dbg !108
  store i32 0, i32* %arrayidx10, align 4, !dbg !109
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest7, i64 0, i64 0, !dbg !110
  %2 = bitcast i32* %arraydecay11 to i8*, !dbg !110
  %arraydecay12 = getelementptr inbounds [150 x i32], [150 x i32]* %data6, i64 0, i64 0, !dbg !110
  %3 = bitcast i32* %arraydecay12 to i8*, !dbg !110
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 %3, i64 396, i1 false), !dbg !110
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest7, i64 0, i64 99, !dbg !111
  store i32 0, i32* %arrayidx13, align 4, !dbg !112
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest7, i64 0, i64 0, !dbg !113
  call void @printWLine(i32* %arraydecay14), !dbg !114
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_12_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_12.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 24, column: 8, scope: !16)
!16 = distinct !DILexicalBlock(scope: !11, file: !12, line: 24, column: 8)
!17 = !DILocation(line: 24, column: 8, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 27, type: !21)
!19 = distinct !DILexicalBlock(scope: !20, file: !12, line: 26, column: 9)
!20 = distinct !DILexicalBlock(scope: !16, file: !12, line: 25, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 4800, elements: !25)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !23, line: 74, baseType: !24)
!23 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !{!26}
!26 = !DISubrange(count: 150)
!27 = !DILocation(line: 27, column: 21, scope: !19)
!28 = !DILocalVariable(name: "dest", scope: !19, file: !12, line: 27, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 27, column: 32, scope: !19)
!33 = !DILocation(line: 29, column: 21, scope: !19)
!34 = !DILocation(line: 29, column: 13, scope: !19)
!35 = !DILocation(line: 30, column: 13, scope: !19)
!36 = !DILocation(line: 30, column: 23, scope: !19)
!37 = !DILocation(line: 31, column: 13, scope: !19)
!38 = !DILocation(line: 33, column: 24, scope: !19)
!39 = !DILocation(line: 33, column: 13, scope: !19)
!40 = !DILocation(line: 35, column: 5, scope: !20)
!41 = !DILocalVariable(name: "data", scope: !42, file: !12, line: 39, type: !21)
!42 = distinct !DILexicalBlock(scope: !43, file: !12, line: 38, column: 9)
!43 = distinct !DILexicalBlock(scope: !16, file: !12, line: 37, column: 5)
!44 = !DILocation(line: 39, column: 21, scope: !42)
!45 = !DILocalVariable(name: "dest", scope: !42, file: !12, line: 39, type: !29)
!46 = !DILocation(line: 39, column: 32, scope: !42)
!47 = !DILocation(line: 41, column: 21, scope: !42)
!48 = !DILocation(line: 41, column: 13, scope: !42)
!49 = !DILocation(line: 42, column: 13, scope: !42)
!50 = !DILocation(line: 42, column: 23, scope: !42)
!51 = !DILocation(line: 43, column: 13, scope: !42)
!52 = !DILocation(line: 44, column: 13, scope: !42)
!53 = !DILocation(line: 44, column: 22, scope: !42)
!54 = !DILocation(line: 45, column: 24, scope: !42)
!55 = !DILocation(line: 45, column: 13, scope: !42)
!56 = !DILocation(line: 48, column: 1, scope: !11)
!57 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_12_good", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 85, column: 5, scope: !57)
!59 = !DILocation(line: 86, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 97, type: !61, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!24, !24, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !12, line: 97, type: !24)
!67 = !DILocation(line: 97, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !12, line: 97, type: !63)
!69 = !DILocation(line: 97, column: 27, scope: !60)
!70 = !DILocation(line: 100, column: 22, scope: !60)
!71 = !DILocation(line: 100, column: 12, scope: !60)
!72 = !DILocation(line: 100, column: 5, scope: !60)
!73 = !DILocation(line: 102, column: 5, scope: !60)
!74 = !DILocation(line: 103, column: 5, scope: !60)
!75 = !DILocation(line: 104, column: 5, scope: !60)
!76 = !DILocation(line: 107, column: 5, scope: !60)
!77 = !DILocation(line: 108, column: 5, scope: !60)
!78 = !DILocation(line: 109, column: 5, scope: !60)
!79 = !DILocation(line: 111, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 57, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !80, file: !12, line: 57, column: 8)
!83 = !DILocation(line: 57, column: 8, scope: !80)
!84 = !DILocalVariable(name: "data", scope: !85, file: !12, line: 60, type: !21)
!85 = distinct !DILexicalBlock(scope: !86, file: !12, line: 59, column: 9)
!86 = distinct !DILexicalBlock(scope: !82, file: !12, line: 58, column: 5)
!87 = !DILocation(line: 60, column: 21, scope: !85)
!88 = !DILocalVariable(name: "dest", scope: !85, file: !12, line: 60, type: !29)
!89 = !DILocation(line: 60, column: 32, scope: !85)
!90 = !DILocation(line: 62, column: 21, scope: !85)
!91 = !DILocation(line: 62, column: 13, scope: !85)
!92 = !DILocation(line: 63, column: 13, scope: !85)
!93 = !DILocation(line: 63, column: 23, scope: !85)
!94 = !DILocation(line: 64, column: 13, scope: !85)
!95 = !DILocation(line: 65, column: 13, scope: !85)
!96 = !DILocation(line: 65, column: 22, scope: !85)
!97 = !DILocation(line: 66, column: 24, scope: !85)
!98 = !DILocation(line: 66, column: 13, scope: !85)
!99 = !DILocation(line: 68, column: 5, scope: !86)
!100 = !DILocalVariable(name: "data", scope: !101, file: !12, line: 72, type: !21)
!101 = distinct !DILexicalBlock(scope: !102, file: !12, line: 71, column: 9)
!102 = distinct !DILexicalBlock(scope: !82, file: !12, line: 70, column: 5)
!103 = !DILocation(line: 72, column: 21, scope: !101)
!104 = !DILocalVariable(name: "dest", scope: !101, file: !12, line: 72, type: !29)
!105 = !DILocation(line: 72, column: 32, scope: !101)
!106 = !DILocation(line: 74, column: 21, scope: !101)
!107 = !DILocation(line: 74, column: 13, scope: !101)
!108 = !DILocation(line: 75, column: 13, scope: !101)
!109 = !DILocation(line: 75, column: 23, scope: !101)
!110 = !DILocation(line: 76, column: 13, scope: !101)
!111 = !DILocation(line: 77, column: 13, scope: !101)
!112 = !DILocation(line: 77, column: 22, scope: !101)
!113 = !DILocation(line: 78, column: 24, scope: !101)
!114 = !DILocation(line: 78, column: 13, scope: !101)
!115 = !DILocation(line: 81, column: 1, scope: !80)
