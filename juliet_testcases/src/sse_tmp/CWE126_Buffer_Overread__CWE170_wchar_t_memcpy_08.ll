; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_08.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_08_bad() #0 !dbg !11 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %call = call i32 @staticReturnsTrue(), !dbg !15
  %tobool = icmp ne i32 %call, 0, !dbg !15
  br i1 %tobool, label %if.then, label %if.end, !dbg !17

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

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_08_good() #0 !dbg !42 {
entry:
  call void @good1(), !dbg !43
  call void @good2(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #5, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #5, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_08_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_08_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !66 {
entry:
  ret i32 1, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !70 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %call = call i32 @staticReturnsFalse(), !dbg !71
  %tobool = icmp ne i32 %call, 0, !dbg !71
  br i1 %tobool, label %if.then, label %if.else, !dbg !73

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !74
  br label %if.end, !dbg !76

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !77, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !81, metadata !DIExpression()), !dbg !82
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !83
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !84
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !85
  store i32 0, i32* %arrayidx, align 4, !dbg !86
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !87
  %0 = bitcast i32* %arraydecay2 to i8*, !dbg !87
  %arraydecay3 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !87
  %1 = bitcast i32* %arraydecay3 to i8*, !dbg !87
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 %1, i64 396, i1 false), !dbg !87
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !88
  store i32 0, i32* %arrayidx4, align 4, !dbg !89
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !90
  call void @printWLine(i32* %arraydecay5), !dbg !91
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !93 {
entry:
  ret i32 0, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !95 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %call = call i32 @staticReturnsTrue(), !dbg !96
  %tobool = icmp ne i32 %call, 0, !dbg !96
  br i1 %tobool, label %if.then, label %if.end, !dbg !98

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !99, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !103, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !105
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !106
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !109
  %0 = bitcast i32* %arraydecay2 to i8*, !dbg !109
  %arraydecay3 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !109
  %1 = bitcast i32* %arraydecay3 to i8*, !dbg !109
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 %1, i64 396, i1 false), !dbg !109
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !110
  store i32 0, i32* %arrayidx4, align 4, !dbg !111
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !112
  call void @printWLine(i32* %arraydecay5), !dbg !113
  br label %if.end, !dbg !114

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_08_bad", scope: !12, file: !12, line: 35, type: !13, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_08.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 37, column: 8, scope: !16)
!16 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 8)
!17 = !DILocation(line: 37, column: 8, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 40, type: !21)
!19 = distinct !DILexicalBlock(scope: !20, file: !12, line: 39, column: 9)
!20 = distinct !DILexicalBlock(scope: !16, file: !12, line: 38, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 4800, elements: !25)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !23, line: 74, baseType: !24)
!23 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !{!26}
!26 = !DISubrange(count: 150)
!27 = !DILocation(line: 40, column: 21, scope: !19)
!28 = !DILocalVariable(name: "dest", scope: !19, file: !12, line: 40, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 40, column: 32, scope: !19)
!33 = !DILocation(line: 42, column: 21, scope: !19)
!34 = !DILocation(line: 42, column: 13, scope: !19)
!35 = !DILocation(line: 43, column: 13, scope: !19)
!36 = !DILocation(line: 43, column: 23, scope: !19)
!37 = !DILocation(line: 44, column: 13, scope: !19)
!38 = !DILocation(line: 46, column: 24, scope: !19)
!39 = !DILocation(line: 46, column: 13, scope: !19)
!40 = !DILocation(line: 48, column: 5, scope: !20)
!41 = !DILocation(line: 49, column: 1, scope: !11)
!42 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_08_good", scope: !12, file: !12, line: 94, type: !13, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 96, column: 5, scope: !42)
!44 = !DILocation(line: 97, column: 5, scope: !42)
!45 = !DILocation(line: 98, column: 1, scope: !42)
!46 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 109, type: !47, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!24, !24, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !12, line: 109, type: !24)
!53 = !DILocation(line: 109, column: 14, scope: !46)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !12, line: 109, type: !49)
!55 = !DILocation(line: 109, column: 27, scope: !46)
!56 = !DILocation(line: 112, column: 22, scope: !46)
!57 = !DILocation(line: 112, column: 12, scope: !46)
!58 = !DILocation(line: 112, column: 5, scope: !46)
!59 = !DILocation(line: 114, column: 5, scope: !46)
!60 = !DILocation(line: 115, column: 5, scope: !46)
!61 = !DILocation(line: 116, column: 5, scope: !46)
!62 = !DILocation(line: 119, column: 5, scope: !46)
!63 = !DILocation(line: 120, column: 5, scope: !46)
!64 = !DILocation(line: 121, column: 5, scope: !46)
!65 = !DILocation(line: 123, column: 5, scope: !46)
!66 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 23, type: !67, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!24}
!69 = !DILocation(line: 25, column: 5, scope: !66)
!70 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 58, column: 8, scope: !72)
!72 = distinct !DILexicalBlock(scope: !70, file: !12, line: 58, column: 8)
!73 = !DILocation(line: 58, column: 8, scope: !70)
!74 = !DILocation(line: 61, column: 9, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !12, line: 59, column: 5)
!76 = !DILocation(line: 62, column: 5, scope: !75)
!77 = !DILocalVariable(name: "data", scope: !78, file: !12, line: 66, type: !21)
!78 = distinct !DILexicalBlock(scope: !79, file: !12, line: 65, column: 9)
!79 = distinct !DILexicalBlock(scope: !72, file: !12, line: 64, column: 5)
!80 = !DILocation(line: 66, column: 21, scope: !78)
!81 = !DILocalVariable(name: "dest", scope: !78, file: !12, line: 66, type: !29)
!82 = !DILocation(line: 66, column: 32, scope: !78)
!83 = !DILocation(line: 68, column: 21, scope: !78)
!84 = !DILocation(line: 68, column: 13, scope: !78)
!85 = !DILocation(line: 69, column: 13, scope: !78)
!86 = !DILocation(line: 69, column: 23, scope: !78)
!87 = !DILocation(line: 70, column: 13, scope: !78)
!88 = !DILocation(line: 71, column: 13, scope: !78)
!89 = !DILocation(line: 71, column: 22, scope: !78)
!90 = !DILocation(line: 72, column: 24, scope: !78)
!91 = !DILocation(line: 72, column: 13, scope: !78)
!92 = !DILocation(line: 75, column: 1, scope: !70)
!93 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 28, type: !67, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocation(line: 30, column: 5, scope: !93)
!95 = distinct !DISubprogram(name: "good2", scope: !12, file: !12, line: 78, type: !13, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocation(line: 80, column: 8, scope: !97)
!97 = distinct !DILexicalBlock(scope: !95, file: !12, line: 80, column: 8)
!98 = !DILocation(line: 80, column: 8, scope: !95)
!99 = !DILocalVariable(name: "data", scope: !100, file: !12, line: 83, type: !21)
!100 = distinct !DILexicalBlock(scope: !101, file: !12, line: 82, column: 9)
!101 = distinct !DILexicalBlock(scope: !97, file: !12, line: 81, column: 5)
!102 = !DILocation(line: 83, column: 21, scope: !100)
!103 = !DILocalVariable(name: "dest", scope: !100, file: !12, line: 83, type: !29)
!104 = !DILocation(line: 83, column: 32, scope: !100)
!105 = !DILocation(line: 85, column: 21, scope: !100)
!106 = !DILocation(line: 85, column: 13, scope: !100)
!107 = !DILocation(line: 86, column: 13, scope: !100)
!108 = !DILocation(line: 86, column: 23, scope: !100)
!109 = !DILocation(line: 87, column: 13, scope: !100)
!110 = !DILocation(line: 88, column: 13, scope: !100)
!111 = !DILocation(line: 88, column: 22, scope: !100)
!112 = !DILocation(line: 89, column: 24, scope: !100)
!113 = !DILocation(line: 89, column: 13, scope: !100)
!114 = !DILocation(line: 91, column: 5, scope: !101)
!115 = !DILocation(line: 92, column: 1, scope: !95)
