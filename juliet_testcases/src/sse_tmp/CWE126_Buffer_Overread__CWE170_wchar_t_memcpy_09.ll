; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_09.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_09_bad() #0 !dbg !11 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !15
  %tobool = icmp ne i32 %0, 0, !dbg !15
  br i1 %tobool, label %if.then, label %if.end, !dbg !17

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !18, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !33
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !34
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !37
  %1 = bitcast i32* %arraydecay1 to i8*, !dbg !37
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !37
  %2 = bitcast i32* %arraydecay2 to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 %2, i64 396, i1 false), !dbg !37
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !38
  call void @printWLine(i32* %arraydecay3), !dbg !39
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
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_09_good() #0 !dbg !42 {
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
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_09_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_09_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !66 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !67
  %tobool = icmp ne i32 %0, 0, !dbg !67
  br i1 %tobool, label %if.then, label %if.else, !dbg !69

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !70
  br label %if.end, !dbg !72

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !73, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !77, metadata !DIExpression()), !dbg !78
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !79
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !80
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !81
  store i32 0, i32* %arrayidx, align 4, !dbg !82
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !83
  %1 = bitcast i32* %arraydecay1 to i8*, !dbg !83
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !83
  %2 = bitcast i32* %arraydecay2 to i8*, !dbg !83
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 %2, i64 396, i1 false), !dbg !83
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !84
  store i32 0, i32* %arrayidx3, align 4, !dbg !85
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !86
  call void @printWLine(i32* %arraydecay4), !dbg !87
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !89 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !90
  %tobool = icmp ne i32 %0, 0, !dbg !90
  br i1 %tobool, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !93, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !97, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !99
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !100
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !101
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !103
  %1 = bitcast i32* %arraydecay1 to i8*, !dbg !103
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !103
  %2 = bitcast i32* %arraydecay2 to i8*, !dbg !103
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 %2, i64 396, i1 false), !dbg !103
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !104
  store i32 0, i32* %arrayidx3, align 4, !dbg !105
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !106
  call void @printWLine(i32* %arraydecay4), !dbg !107
  br label %if.end, !dbg !108

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !109
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_09.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_09_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_09.c", directory: "/root/SSE-Assessment")
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
!23 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
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
!41 = !DILocation(line: 36, column: 1, scope: !11)
!42 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_09_good", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 83, column: 5, scope: !42)
!44 = !DILocation(line: 84, column: 5, scope: !42)
!45 = !DILocation(line: 85, column: 1, scope: !42)
!46 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 96, type: !47, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!24, !24, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !12, line: 96, type: !24)
!53 = !DILocation(line: 96, column: 14, scope: !46)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !12, line: 96, type: !49)
!55 = !DILocation(line: 96, column: 27, scope: !46)
!56 = !DILocation(line: 99, column: 22, scope: !46)
!57 = !DILocation(line: 99, column: 12, scope: !46)
!58 = !DILocation(line: 99, column: 5, scope: !46)
!59 = !DILocation(line: 101, column: 5, scope: !46)
!60 = !DILocation(line: 102, column: 5, scope: !46)
!61 = !DILocation(line: 103, column: 5, scope: !46)
!62 = !DILocation(line: 106, column: 5, scope: !46)
!63 = !DILocation(line: 107, column: 5, scope: !46)
!64 = !DILocation(line: 108, column: 5, scope: !46)
!65 = !DILocation(line: 110, column: 5, scope: !46)
!66 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 43, type: !13, scopeLine: 44, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 45, column: 8, scope: !68)
!68 = distinct !DILexicalBlock(scope: !66, file: !12, line: 45, column: 8)
!69 = !DILocation(line: 45, column: 8, scope: !66)
!70 = !DILocation(line: 48, column: 9, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !12, line: 46, column: 5)
!72 = !DILocation(line: 49, column: 5, scope: !71)
!73 = !DILocalVariable(name: "data", scope: !74, file: !12, line: 53, type: !21)
!74 = distinct !DILexicalBlock(scope: !75, file: !12, line: 52, column: 9)
!75 = distinct !DILexicalBlock(scope: !68, file: !12, line: 51, column: 5)
!76 = !DILocation(line: 53, column: 21, scope: !74)
!77 = !DILocalVariable(name: "dest", scope: !74, file: !12, line: 53, type: !29)
!78 = !DILocation(line: 53, column: 32, scope: !74)
!79 = !DILocation(line: 55, column: 21, scope: !74)
!80 = !DILocation(line: 55, column: 13, scope: !74)
!81 = !DILocation(line: 56, column: 13, scope: !74)
!82 = !DILocation(line: 56, column: 23, scope: !74)
!83 = !DILocation(line: 57, column: 13, scope: !74)
!84 = !DILocation(line: 58, column: 13, scope: !74)
!85 = !DILocation(line: 58, column: 22, scope: !74)
!86 = !DILocation(line: 59, column: 24, scope: !74)
!87 = !DILocation(line: 59, column: 13, scope: !74)
!88 = !DILocation(line: 62, column: 1, scope: !66)
!89 = distinct !DISubprogram(name: "good2", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocation(line: 67, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !89, file: !12, line: 67, column: 8)
!92 = !DILocation(line: 67, column: 8, scope: !89)
!93 = !DILocalVariable(name: "data", scope: !94, file: !12, line: 70, type: !21)
!94 = distinct !DILexicalBlock(scope: !95, file: !12, line: 69, column: 9)
!95 = distinct !DILexicalBlock(scope: !91, file: !12, line: 68, column: 5)
!96 = !DILocation(line: 70, column: 21, scope: !94)
!97 = !DILocalVariable(name: "dest", scope: !94, file: !12, line: 70, type: !29)
!98 = !DILocation(line: 70, column: 32, scope: !94)
!99 = !DILocation(line: 72, column: 21, scope: !94)
!100 = !DILocation(line: 72, column: 13, scope: !94)
!101 = !DILocation(line: 73, column: 13, scope: !94)
!102 = !DILocation(line: 73, column: 23, scope: !94)
!103 = !DILocation(line: 74, column: 13, scope: !94)
!104 = !DILocation(line: 75, column: 13, scope: !94)
!105 = !DILocation(line: 75, column: 22, scope: !94)
!106 = !DILocation(line: 76, column: 24, scope: !94)
!107 = !DILocation(line: 76, column: 13, scope: !94)
!108 = !DILocation(line: 78, column: 5, scope: !95)
!109 = !DILocation(line: 79, column: 1, scope: !89)
