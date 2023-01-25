; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i32], i8*, i8* }

@.str = private unnamed_addr constant [32 x i32] [i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_17_bad() #0 !dbg !16 {
entry:
  %j = alloca i32, align 4
  %structCharVoid = alloca %struct._charVoid, align 8
  call void @llvm.dbg.declare(metadata i32* %j, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 0, i32* %j, align 4, !dbg !22
  br label %for.cond, !dbg !24

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %j, align 4, !dbg !25
  %cmp = icmp slt i32 %0, 1, !dbg !27
  br i1 %cmp, label %for.body, label %for.end, !dbg !28

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !29, metadata !DIExpression()), !dbg !41
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !42
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !43
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !44
  %1 = load i8*, i8** %voidSecond1, align 8, !dbg !44
  %2 = bitcast i8* %1 to i32*, !dbg !45
  call void @printWLine(i32* %2), !dbg !46
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !47
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !48
  %3 = bitcast i32* %arraydecay to i8*, !dbg !48
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %3, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !48
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !49
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !50
  store i32 0, i32* %arrayidx, align 4, !dbg !51
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !52
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !53
  call void @printWLine(i32* %arraydecay4), !dbg !54
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !55
  %4 = load i8*, i8** %voidSecond5, align 8, !dbg !55
  %5 = bitcast i8* %4 to i32*, !dbg !56
  call void @printWLine(i32* %5), !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %j, align 4, !dbg !59
  %inc = add nsw i32 %6, 1, !dbg !59
  store i32 %inc, i32* %j, align 4, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printWLine(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_17_good() #0 !dbg !65 {
entry:
  call void @good1(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #5, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #5, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_17_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_17_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !88 {
entry:
  %k = alloca i32, align 4
  %structCharVoid = alloca %struct._charVoid, align 8
  call void @llvm.dbg.declare(metadata i32* %k, metadata !89, metadata !DIExpression()), !dbg !90
  store i32 0, i32* %k, align 4, !dbg !91
  br label %for.cond, !dbg !93

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %k, align 4, !dbg !94
  %cmp = icmp slt i32 %0, 1, !dbg !96
  br i1 %cmp, label %for.body, label %for.end, !dbg !97

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !98, metadata !DIExpression()), !dbg !101
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !102
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !103
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !104
  %1 = load i8*, i8** %voidSecond1, align 8, !dbg !104
  %2 = bitcast i8* %1 to i32*, !dbg !105
  call void @printWLine(i32* %2), !dbg !106
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !107
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !108
  %3 = bitcast i32* %arraydecay to i8*, !dbg !108
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %3, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !108
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !109
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !110
  store i32 0, i32* %arrayidx, align 4, !dbg !111
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !112
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !113
  call void @printWLine(i32* %arraydecay4), !dbg !114
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !115
  %4 = load i8*, i8** %voidSecond5, align 8, !dbg !115
  %5 = bitcast i8* %4 to i32*, !dbg !116
  call void @printWLine(i32* %5), !dbg !117
  br label %for.inc, !dbg !118

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %k, align 4, !dbg !119
  %inc = add nsw i32 %6, 1, !dbg !119
  store i32 %inc, i32* %k, align 4, !dbg !119
  br label %for.cond, !dbg !120, !llvm.loop !121

for.end:                                          ; preds = %for.cond
  ret void, !dbg !123
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_17_bad", scope: !17, file: !17, line: 34, type: !18, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "j", scope: !16, file: !17, line: 36, type: !8)
!21 = !DILocation(line: 36, column: 9, scope: !16)
!22 = !DILocation(line: 37, column: 11, scope: !23)
!23 = distinct !DILexicalBlock(scope: !16, file: !17, line: 37, column: 5)
!24 = !DILocation(line: 37, column: 9, scope: !23)
!25 = !DILocation(line: 37, column: 16, scope: !26)
!26 = distinct !DILexicalBlock(scope: !23, file: !17, line: 37, column: 5)
!27 = !DILocation(line: 37, column: 18, scope: !26)
!28 = !DILocation(line: 37, column: 5, scope: !23)
!29 = !DILocalVariable(name: "structCharVoid", scope: !30, file: !17, line: 40, type: !32)
!30 = distinct !DILexicalBlock(scope: !31, file: !17, line: 39, column: 9)
!31 = distinct !DILexicalBlock(scope: !26, file: !17, line: 38, column: 5)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !17, line: 30, baseType: !33)
!33 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !17, line: 25, size: 640, elements: !34)
!34 = !{!35, !39, !40}
!35 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !33, file: !17, line: 27, baseType: !36, size: 512)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 512, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 16)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !33, file: !17, line: 28, baseType: !4, size: 64, offset: 512)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !33, file: !17, line: 29, baseType: !4, size: 64, offset: 576)
!41 = !DILocation(line: 40, column: 22, scope: !30)
!42 = !DILocation(line: 41, column: 28, scope: !30)
!43 = !DILocation(line: 41, column: 39, scope: !30)
!44 = !DILocation(line: 43, column: 50, scope: !30)
!45 = !DILocation(line: 43, column: 24, scope: !30)
!46 = !DILocation(line: 43, column: 13, scope: !30)
!47 = !DILocation(line: 45, column: 36, scope: !30)
!48 = !DILocation(line: 45, column: 13, scope: !30)
!49 = !DILocation(line: 46, column: 28, scope: !30)
!50 = !DILocation(line: 46, column: 13, scope: !30)
!51 = !DILocation(line: 46, column: 92, scope: !30)
!52 = !DILocation(line: 47, column: 50, scope: !30)
!53 = !DILocation(line: 47, column: 35, scope: !30)
!54 = !DILocation(line: 47, column: 13, scope: !30)
!55 = !DILocation(line: 48, column: 50, scope: !30)
!56 = !DILocation(line: 48, column: 24, scope: !30)
!57 = !DILocation(line: 48, column: 13, scope: !30)
!58 = !DILocation(line: 50, column: 5, scope: !31)
!59 = !DILocation(line: 37, column: 24, scope: !26)
!60 = !DILocation(line: 37, column: 5, scope: !26)
!61 = distinct !{!61, !28, !62, !63}
!62 = !DILocation(line: 50, column: 5, scope: !23)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 51, column: 1, scope: !16)
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_17_good", scope: !17, file: !17, line: 77, type: !18, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 79, column: 5, scope: !65)
!67 = !DILocation(line: 80, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 91, type: !69, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!8, !8, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !17, line: 91, type: !8)
!75 = !DILocation(line: 91, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !17, line: 91, type: !71)
!77 = !DILocation(line: 91, column: 27, scope: !68)
!78 = !DILocation(line: 94, column: 22, scope: !68)
!79 = !DILocation(line: 94, column: 12, scope: !68)
!80 = !DILocation(line: 94, column: 5, scope: !68)
!81 = !DILocation(line: 96, column: 5, scope: !68)
!82 = !DILocation(line: 97, column: 5, scope: !68)
!83 = !DILocation(line: 98, column: 5, scope: !68)
!84 = !DILocation(line: 101, column: 5, scope: !68)
!85 = !DILocation(line: 102, column: 5, scope: !68)
!86 = !DILocation(line: 103, column: 5, scope: !68)
!87 = !DILocation(line: 105, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "good1", scope: !17, file: !17, line: 58, type: !18, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "k", scope: !88, file: !17, line: 60, type: !8)
!90 = !DILocation(line: 60, column: 9, scope: !88)
!91 = !DILocation(line: 61, column: 11, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !17, line: 61, column: 5)
!93 = !DILocation(line: 61, column: 9, scope: !92)
!94 = !DILocation(line: 61, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !17, line: 61, column: 5)
!96 = !DILocation(line: 61, column: 18, scope: !95)
!97 = !DILocation(line: 61, column: 5, scope: !92)
!98 = !DILocalVariable(name: "structCharVoid", scope: !99, file: !17, line: 64, type: !32)
!99 = distinct !DILexicalBlock(scope: !100, file: !17, line: 63, column: 9)
!100 = distinct !DILexicalBlock(scope: !95, file: !17, line: 62, column: 5)
!101 = !DILocation(line: 64, column: 22, scope: !99)
!102 = !DILocation(line: 65, column: 28, scope: !99)
!103 = !DILocation(line: 65, column: 39, scope: !99)
!104 = !DILocation(line: 67, column: 50, scope: !99)
!105 = !DILocation(line: 67, column: 24, scope: !99)
!106 = !DILocation(line: 67, column: 13, scope: !99)
!107 = !DILocation(line: 69, column: 36, scope: !99)
!108 = !DILocation(line: 69, column: 13, scope: !99)
!109 = !DILocation(line: 70, column: 28, scope: !99)
!110 = !DILocation(line: 70, column: 13, scope: !99)
!111 = !DILocation(line: 70, column: 92, scope: !99)
!112 = !DILocation(line: 71, column: 50, scope: !99)
!113 = !DILocation(line: 71, column: 35, scope: !99)
!114 = !DILocation(line: 71, column: 13, scope: !99)
!115 = !DILocation(line: 72, column: 50, scope: !99)
!116 = !DILocation(line: 72, column: 24, scope: !99)
!117 = !DILocation(line: 72, column: 13, scope: !99)
!118 = !DILocation(line: 74, column: 5, scope: !100)
!119 = !DILocation(line: 61, column: 24, scope: !95)
!120 = !DILocation(line: 61, column: 5, scope: !95)
!121 = distinct !{!121, !97, !122, !63}
!122 = !DILocation(line: 74, column: 5, scope: !92)
!123 = !DILocation(line: 75, column: 1, scope: !88)
