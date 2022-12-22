; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_10.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_10.c"
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
define dso_local void @CWE126_Buffer_Overread__CWE170_char_memcpy_10_bad() #0 !dbg !11 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %0 = load i32, i32* @globalTrue, align 4, !dbg !15
  %tobool = icmp ne i32 %0, 0, !dbg !15
  br i1 %tobool, label %if.then, label %if.end, !dbg !17

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

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_memcpy_10_good() #0 !dbg !39 {
entry:
  call void @good1(), !dbg !40
  call void @good2(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* null) #6, !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 %conv) #6, !dbg !55
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE126_Buffer_Overread__CWE170_char_memcpy_10_good(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE126_Buffer_Overread__CWE170_char_memcpy_10_bad(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !63 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %0 = load i32, i32* @globalFalse, align 4, !dbg !64
  %tobool = icmp ne i32 %0, 0, !dbg !64
  br i1 %tobool, label %if.then, label %if.else, !dbg !66

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !67
  br label %if.end, !dbg !69

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !70, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !74, metadata !DIExpression()), !dbg !75
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !76
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !77
  store i8 0, i8* %arrayidx, align 1, !dbg !78
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !79
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !79
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 16 %arraydecay2, i64 99, i1 false), !dbg !79
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !80
  store i8 0, i8* %arrayidx3, align 1, !dbg !81
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !82
  call void @printLine(i8* %arraydecay4), !dbg !83
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !85 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %0 = load i32, i32* @globalTrue, align 4, !dbg !86
  %tobool = icmp ne i32 %0, 0, !dbg !86
  br i1 %tobool, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !89, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !93, metadata !DIExpression()), !dbg !94
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !95
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !98
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !98
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 16 %arraydecay2, i64 99, i1 false), !dbg !98
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !99
  store i8 0, i8* %arrayidx3, align 1, !dbg !100
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !101
  call void @printLine(i8* %arraydecay4), !dbg !102
  br label %if.end, !dbg !103

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !104
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_10.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_memcpy_10_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_10.c", directory: "/root/SSE-Assessment")
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
!38 = !DILocation(line: 36, column: 1, scope: !11)
!39 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_memcpy_10_good", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocation(line: 83, column: 5, scope: !39)
!41 = !DILocation(line: 84, column: 5, scope: !39)
!42 = !DILocation(line: 85, column: 1, scope: !39)
!43 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 96, type: !44, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!46, !46, !47}
!46 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !12, line: 96, type: !46)
!50 = !DILocation(line: 96, column: 14, scope: !43)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !12, line: 96, type: !47)
!52 = !DILocation(line: 96, column: 27, scope: !43)
!53 = !DILocation(line: 99, column: 22, scope: !43)
!54 = !DILocation(line: 99, column: 12, scope: !43)
!55 = !DILocation(line: 99, column: 5, scope: !43)
!56 = !DILocation(line: 101, column: 5, scope: !43)
!57 = !DILocation(line: 102, column: 5, scope: !43)
!58 = !DILocation(line: 103, column: 5, scope: !43)
!59 = !DILocation(line: 106, column: 5, scope: !43)
!60 = !DILocation(line: 107, column: 5, scope: !43)
!61 = !DILocation(line: 108, column: 5, scope: !43)
!62 = !DILocation(line: 110, column: 5, scope: !43)
!63 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 43, type: !13, scopeLine: 44, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 45, column: 8, scope: !65)
!65 = distinct !DILexicalBlock(scope: !63, file: !12, line: 45, column: 8)
!66 = !DILocation(line: 45, column: 8, scope: !63)
!67 = !DILocation(line: 48, column: 9, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !12, line: 46, column: 5)
!69 = !DILocation(line: 49, column: 5, scope: !68)
!70 = !DILocalVariable(name: "data", scope: !71, file: !12, line: 53, type: !21)
!71 = distinct !DILexicalBlock(scope: !72, file: !12, line: 52, column: 9)
!72 = distinct !DILexicalBlock(scope: !65, file: !12, line: 51, column: 5)
!73 = !DILocation(line: 53, column: 18, scope: !71)
!74 = !DILocalVariable(name: "dest", scope: !71, file: !12, line: 53, type: !27)
!75 = !DILocation(line: 53, column: 29, scope: !71)
!76 = !DILocation(line: 55, column: 13, scope: !71)
!77 = !DILocation(line: 56, column: 13, scope: !71)
!78 = !DILocation(line: 56, column: 23, scope: !71)
!79 = !DILocation(line: 57, column: 13, scope: !71)
!80 = !DILocation(line: 58, column: 13, scope: !71)
!81 = !DILocation(line: 58, column: 22, scope: !71)
!82 = !DILocation(line: 59, column: 23, scope: !71)
!83 = !DILocation(line: 59, column: 13, scope: !71)
!84 = !DILocation(line: 62, column: 1, scope: !63)
!85 = distinct !DISubprogram(name: "good2", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 67, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !85, file: !12, line: 67, column: 8)
!88 = !DILocation(line: 67, column: 8, scope: !85)
!89 = !DILocalVariable(name: "data", scope: !90, file: !12, line: 70, type: !21)
!90 = distinct !DILexicalBlock(scope: !91, file: !12, line: 69, column: 9)
!91 = distinct !DILexicalBlock(scope: !87, file: !12, line: 68, column: 5)
!92 = !DILocation(line: 70, column: 18, scope: !90)
!93 = !DILocalVariable(name: "dest", scope: !90, file: !12, line: 70, type: !27)
!94 = !DILocation(line: 70, column: 29, scope: !90)
!95 = !DILocation(line: 72, column: 13, scope: !90)
!96 = !DILocation(line: 73, column: 13, scope: !90)
!97 = !DILocation(line: 73, column: 23, scope: !90)
!98 = !DILocation(line: 74, column: 13, scope: !90)
!99 = !DILocation(line: 75, column: 13, scope: !90)
!100 = !DILocation(line: 75, column: 22, scope: !90)
!101 = !DILocation(line: 76, column: 23, scope: !90)
!102 = !DILocation(line: 76, column: 13, scope: !90)
!103 = !DILocation(line: 78, column: 5, scope: !91)
!104 = !DILocation(line: 79, column: 1, scope: !85)
