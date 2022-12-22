; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_17_bad() #0 !dbg !14 {
entry:
  %j = alloca i32, align 4
  %structCharVoid = alloca %struct._charVoid, align 8
  call void @llvm.dbg.declare(metadata i32* %j, metadata !18, metadata !DIExpression()), !dbg !20
  store i32 0, i32* %j, align 4, !dbg !21
  br label %for.cond, !dbg !23

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %j, align 4, !dbg !24
  %cmp = icmp slt i32 %0, 1, !dbg !26
  br i1 %cmp, label %for.body, label %for.end, !dbg !27

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !28, metadata !DIExpression()), !dbg !40
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !41
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !42
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !43
  %1 = load i8*, i8** %voidSecond1, align 8, !dbg !43
  call void @printLine(i8* %1), !dbg !44
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !45
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !46
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !47
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !48
  store i8 0, i8* %arrayidx, align 1, !dbg !49
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !50
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !51
  call void @printLine(i8* %arraydecay4), !dbg !52
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !53
  %2 = load i8*, i8** %voidSecond5, align 8, !dbg !53
  call void @printLine(i8* %2), !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %j, align 4, !dbg !56
  %inc = add nsw i32 %3, 1, !dbg !56
  store i32 %inc, i32* %j, align 4, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printLine(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_17_good() #0 !dbg !62 {
entry:
  call void @good1(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #5, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #5, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_17_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_17_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !83 {
entry:
  %k = alloca i32, align 4
  %structCharVoid = alloca %struct._charVoid, align 8
  call void @llvm.dbg.declare(metadata i32* %k, metadata !84, metadata !DIExpression()), !dbg !85
  store i32 0, i32* %k, align 4, !dbg !86
  br label %for.cond, !dbg !88

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %k, align 4, !dbg !89
  %cmp = icmp slt i32 %0, 1, !dbg !91
  br i1 %cmp, label %for.body, label %for.end, !dbg !92

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !93, metadata !DIExpression()), !dbg !96
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !97
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !98
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !99
  %1 = load i8*, i8** %voidSecond1, align 8, !dbg !99
  call void @printLine(i8* %1), !dbg !100
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !101
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !102
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !102
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !103
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !104
  store i8 0, i8* %arrayidx, align 1, !dbg !105
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !106
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !107
  call void @printLine(i8* %arraydecay4), !dbg !108
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !109
  %2 = load i8*, i8** %voidSecond5, align 8, !dbg !109
  call void @printLine(i8* %2), !dbg !110
  br label %for.inc, !dbg !111

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %k, align 4, !dbg !112
  %inc = add nsw i32 %3, 1, !dbg !112
  store i32 %inc, i32* %k, align 4, !dbg !112
  br label %for.cond, !dbg !113, !llvm.loop !114

for.end:                                          ; preds = %for.cond
  ret void, !dbg !116
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_17.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_17_bad", scope: !15, file: !15, line: 34, type: !16, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_17.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "j", scope: !14, file: !15, line: 36, type: !19)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 36, column: 9, scope: !14)
!21 = !DILocation(line: 37, column: 11, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!23 = !DILocation(line: 37, column: 9, scope: !22)
!24 = !DILocation(line: 37, column: 16, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 37, column: 5)
!26 = !DILocation(line: 37, column: 18, scope: !25)
!27 = !DILocation(line: 37, column: 5, scope: !22)
!28 = !DILocalVariable(name: "structCharVoid", scope: !29, file: !15, line: 40, type: !31)
!29 = distinct !DILexicalBlock(scope: !30, file: !15, line: 39, column: 9)
!30 = distinct !DILexicalBlock(scope: !25, file: !15, line: 38, column: 5)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !15, line: 30, baseType: !32)
!32 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !15, line: 25, size: 256, elements: !33)
!33 = !{!34, !38, !39}
!34 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !32, file: !15, line: 27, baseType: !35, size: 128)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 128, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 16)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !32, file: !15, line: 28, baseType: !4, size: 64, offset: 128)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !32, file: !15, line: 29, baseType: !4, size: 64, offset: 192)
!40 = !DILocation(line: 40, column: 22, scope: !29)
!41 = !DILocation(line: 41, column: 28, scope: !29)
!42 = !DILocation(line: 41, column: 39, scope: !29)
!43 = !DILocation(line: 43, column: 46, scope: !29)
!44 = !DILocation(line: 43, column: 13, scope: !29)
!45 = !DILocation(line: 45, column: 35, scope: !29)
!46 = !DILocation(line: 45, column: 13, scope: !29)
!47 = !DILocation(line: 46, column: 28, scope: !29)
!48 = !DILocation(line: 46, column: 13, scope: !29)
!49 = !DILocation(line: 46, column: 89, scope: !29)
!50 = !DILocation(line: 47, column: 46, scope: !29)
!51 = !DILocation(line: 47, column: 31, scope: !29)
!52 = !DILocation(line: 47, column: 13, scope: !29)
!53 = !DILocation(line: 48, column: 46, scope: !29)
!54 = !DILocation(line: 48, column: 13, scope: !29)
!55 = !DILocation(line: 50, column: 5, scope: !30)
!56 = !DILocation(line: 37, column: 24, scope: !25)
!57 = !DILocation(line: 37, column: 5, scope: !25)
!58 = distinct !{!58, !27, !59, !60}
!59 = !DILocation(line: 50, column: 5, scope: !22)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 51, column: 1, scope: !14)
!62 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_17_good", scope: !15, file: !15, line: 77, type: !16, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 79, column: 5, scope: !62)
!64 = !DILocation(line: 80, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 91, type: !66, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!19, !19, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !15, line: 91, type: !19)
!70 = !DILocation(line: 91, column: 14, scope: !65)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !15, line: 91, type: !68)
!72 = !DILocation(line: 91, column: 27, scope: !65)
!73 = !DILocation(line: 94, column: 22, scope: !65)
!74 = !DILocation(line: 94, column: 12, scope: !65)
!75 = !DILocation(line: 94, column: 5, scope: !65)
!76 = !DILocation(line: 96, column: 5, scope: !65)
!77 = !DILocation(line: 97, column: 5, scope: !65)
!78 = !DILocation(line: 98, column: 5, scope: !65)
!79 = !DILocation(line: 101, column: 5, scope: !65)
!80 = !DILocation(line: 102, column: 5, scope: !65)
!81 = !DILocation(line: 103, column: 5, scope: !65)
!82 = !DILocation(line: 105, column: 5, scope: !65)
!83 = distinct !DISubprogram(name: "good1", scope: !15, file: !15, line: 58, type: !16, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "k", scope: !83, file: !15, line: 60, type: !19)
!85 = !DILocation(line: 60, column: 9, scope: !83)
!86 = !DILocation(line: 61, column: 11, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !15, line: 61, column: 5)
!88 = !DILocation(line: 61, column: 9, scope: !87)
!89 = !DILocation(line: 61, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !15, line: 61, column: 5)
!91 = !DILocation(line: 61, column: 18, scope: !90)
!92 = !DILocation(line: 61, column: 5, scope: !87)
!93 = !DILocalVariable(name: "structCharVoid", scope: !94, file: !15, line: 64, type: !31)
!94 = distinct !DILexicalBlock(scope: !95, file: !15, line: 63, column: 9)
!95 = distinct !DILexicalBlock(scope: !90, file: !15, line: 62, column: 5)
!96 = !DILocation(line: 64, column: 22, scope: !94)
!97 = !DILocation(line: 65, column: 28, scope: !94)
!98 = !DILocation(line: 65, column: 39, scope: !94)
!99 = !DILocation(line: 67, column: 46, scope: !94)
!100 = !DILocation(line: 67, column: 13, scope: !94)
!101 = !DILocation(line: 69, column: 35, scope: !94)
!102 = !DILocation(line: 69, column: 13, scope: !94)
!103 = !DILocation(line: 70, column: 28, scope: !94)
!104 = !DILocation(line: 70, column: 13, scope: !94)
!105 = !DILocation(line: 70, column: 89, scope: !94)
!106 = !DILocation(line: 71, column: 46, scope: !94)
!107 = !DILocation(line: 71, column: 31, scope: !94)
!108 = !DILocation(line: 71, column: 13, scope: !94)
!109 = !DILocation(line: 72, column: 46, scope: !94)
!110 = !DILocation(line: 72, column: 13, scope: !94)
!111 = !DILocation(line: 74, column: 5, scope: !95)
!112 = !DILocation(line: 61, column: 24, scope: !90)
!113 = !DILocation(line: 61, column: 5, scope: !90)
!114 = distinct !{!114, !92, !115, !60}
!115 = !DILocation(line: 74, column: 5, scope: !87)
!116 = !DILocation(line: 75, column: 1, scope: !83)
