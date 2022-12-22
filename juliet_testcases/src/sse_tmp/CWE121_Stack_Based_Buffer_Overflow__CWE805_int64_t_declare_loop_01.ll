; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !15, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !33
  store i64* %arraydecay, i64** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !35, metadata !DIExpression()), !dbg !37
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !47
  %cmp = icmp ult i64 %1, 100, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !53
  %3 = load i64, i64* %arrayidx, align 8, !dbg !53
  %4 = load i64*, i64** %data, align 8, !dbg !54
  %5 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !54
  store i64 %3, i64* %arrayidx1, align 8, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %6, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !63
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !63
  call void @printLongLongLine(i64 %8), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_01_good() #0 !dbg !66 {
entry:
  call void @goodG2B(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #5, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #5, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_01_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_01_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !97
  store i64* %arraydecay, i64** %data, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !101
  call void @llvm.dbg.declare(metadata i64* %i, metadata !102, metadata !DIExpression()), !dbg !104
  store i64 0, i64* %i, align 8, !dbg !105
  br label %for.cond, !dbg !107

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !108
  %cmp = icmp ult i64 %1, 100, !dbg !110
  br i1 %cmp, label %for.body, label %for.end, !dbg !111

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !112
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !114
  %3 = load i64, i64* %arrayidx, align 8, !dbg !114
  %4 = load i64*, i64** %data, align 8, !dbg !115
  %5 = load i64, i64* %i, align 8, !dbg !116
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !115
  store i64 %3, i64* %arrayidx1, align 8, !dbg !117
  br label %for.inc, !dbg !118

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !119
  %inc = add i64 %6, 1, !dbg !119
  store i64 %inc, i64* %i, align 8, !dbg !119
  br label %for.cond, !dbg !120, !llvm.loop !121

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data, align 8, !dbg !123
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !123
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !123
  call void @printLongLongLine(i64 %8), !dbg !124
  ret void, !dbg !125
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_01_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_01.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !18, line: 27, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !20, line: 43, baseType: !21)
!20 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!21 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!22 = !DILocation(line: 23, column: 15, scope: !11)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 24, column: 13, scope: !11)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 25, column: 13, scope: !11)
!33 = !DILocation(line: 28, column: 12, scope: !11)
!34 = !DILocation(line: 28, column: 10, scope: !11)
!35 = !DILocalVariable(name: "source", scope: !36, file: !12, line: 30, type: !29)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!37 = !DILocation(line: 30, column: 17, scope: !36)
!38 = !DILocalVariable(name: "i", scope: !39, file: !12, line: 32, type: !40)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 31, column: 9)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 32, column: 20, scope: !39)
!44 = !DILocation(line: 34, column: 20, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !12, line: 34, column: 13)
!46 = !DILocation(line: 34, column: 18, scope: !45)
!47 = !DILocation(line: 34, column: 25, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !12, line: 34, column: 13)
!49 = !DILocation(line: 34, column: 27, scope: !48)
!50 = !DILocation(line: 34, column: 13, scope: !45)
!51 = !DILocation(line: 36, column: 34, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !12, line: 35, column: 13)
!53 = !DILocation(line: 36, column: 27, scope: !52)
!54 = !DILocation(line: 36, column: 17, scope: !52)
!55 = !DILocation(line: 36, column: 22, scope: !52)
!56 = !DILocation(line: 36, column: 25, scope: !52)
!57 = !DILocation(line: 37, column: 13, scope: !52)
!58 = !DILocation(line: 34, column: 35, scope: !48)
!59 = !DILocation(line: 34, column: 13, scope: !48)
!60 = distinct !{!60, !50, !61, !62}
!61 = !DILocation(line: 37, column: 13, scope: !45)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 38, column: 31, scope: !39)
!64 = !DILocation(line: 38, column: 13, scope: !39)
!65 = !DILocation(line: 41, column: 1, scope: !11)
!66 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_01_good", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 71, column: 5, scope: !66)
!68 = !DILocation(line: 72, column: 1, scope: !66)
!69 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 84, type: !70, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!72, !72, !73}
!72 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !12, line: 84, type: !72)
!77 = !DILocation(line: 84, column: 14, scope: !69)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !12, line: 84, type: !73)
!79 = !DILocation(line: 84, column: 27, scope: !69)
!80 = !DILocation(line: 87, column: 22, scope: !69)
!81 = !DILocation(line: 87, column: 12, scope: !69)
!82 = !DILocation(line: 87, column: 5, scope: !69)
!83 = !DILocation(line: 89, column: 5, scope: !69)
!84 = !DILocation(line: 90, column: 5, scope: !69)
!85 = !DILocation(line: 91, column: 5, scope: !69)
!86 = !DILocation(line: 94, column: 5, scope: !69)
!87 = !DILocation(line: 95, column: 5, scope: !69)
!88 = !DILocation(line: 96, column: 5, scope: !69)
!89 = !DILocation(line: 98, column: 5, scope: !69)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 48, type: !13, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !12, line: 50, type: !16)
!92 = !DILocation(line: 50, column: 15, scope: !90)
!93 = !DILocalVariable(name: "dataBadBuffer", scope: !90, file: !12, line: 51, type: !24)
!94 = !DILocation(line: 51, column: 13, scope: !90)
!95 = !DILocalVariable(name: "dataGoodBuffer", scope: !90, file: !12, line: 52, type: !29)
!96 = !DILocation(line: 52, column: 13, scope: !90)
!97 = !DILocation(line: 54, column: 12, scope: !90)
!98 = !DILocation(line: 54, column: 10, scope: !90)
!99 = !DILocalVariable(name: "source", scope: !100, file: !12, line: 56, type: !29)
!100 = distinct !DILexicalBlock(scope: !90, file: !12, line: 55, column: 5)
!101 = !DILocation(line: 56, column: 17, scope: !100)
!102 = !DILocalVariable(name: "i", scope: !103, file: !12, line: 58, type: !40)
!103 = distinct !DILexicalBlock(scope: !100, file: !12, line: 57, column: 9)
!104 = !DILocation(line: 58, column: 20, scope: !103)
!105 = !DILocation(line: 60, column: 20, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !12, line: 60, column: 13)
!107 = !DILocation(line: 60, column: 18, scope: !106)
!108 = !DILocation(line: 60, column: 25, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !12, line: 60, column: 13)
!110 = !DILocation(line: 60, column: 27, scope: !109)
!111 = !DILocation(line: 60, column: 13, scope: !106)
!112 = !DILocation(line: 62, column: 34, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !12, line: 61, column: 13)
!114 = !DILocation(line: 62, column: 27, scope: !113)
!115 = !DILocation(line: 62, column: 17, scope: !113)
!116 = !DILocation(line: 62, column: 22, scope: !113)
!117 = !DILocation(line: 62, column: 25, scope: !113)
!118 = !DILocation(line: 63, column: 13, scope: !113)
!119 = !DILocation(line: 60, column: 35, scope: !109)
!120 = !DILocation(line: 60, column: 13, scope: !109)
!121 = distinct !{!121, !111, !122, !62}
!122 = !DILocation(line: 63, column: 13, scope: !106)
!123 = !DILocation(line: 64, column: 31, scope: !103)
!124 = !DILocation(line: 64, column: 13, scope: !103)
!125 = !DILocation(line: 67, column: 1, scope: !90)
