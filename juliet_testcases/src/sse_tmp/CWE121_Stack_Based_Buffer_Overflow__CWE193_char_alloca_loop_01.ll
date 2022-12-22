; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_01_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_01_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 10, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 11, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !25
  store i8* %2, i8** %data, align 8, !dbg !26
  %3 = load i8*, i8** %data, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !29, metadata !DIExpression()), !dbg !34
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !34
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_01_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !40, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !42
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !43
  store i64 %call, i64* %sourceLen, align 8, !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !48
  %6 = load i64, i64* %sourceLen, align 8, !dbg !50
  %add = add i64 %6, 1, !dbg !51
  %cmp = icmp ult i64 %5, %add, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !56
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !56
  %9 = load i8*, i8** %data, align 8, !dbg !57
  %10 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !57
  store i8 %8, i8* %arrayidx2, align 1, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %11, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !66
  call void @printLine(i8* %12), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_01_good() #0 !dbg !69 {
entry:
  call void @goodG2B(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #7, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #7, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_01_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_01_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !91 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  %0 = alloca i8, i64 10, align 16, !dbg !96
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %1 = alloca i8, i64 11, align 16, !dbg !99
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !98
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !100
  store i8* %2, i8** %data, align 8, !dbg !101
  %3 = load i8*, i8** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !106
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !106
  call void @llvm.dbg.declare(metadata i64* %i, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !109, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !111
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !112
  store i64 %call, i64* %sourceLen, align 8, !dbg !113
  store i64 0, i64* %i, align 8, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !117
  %6 = load i64, i64* %sourceLen, align 8, !dbg !119
  %add = add i64 %6, 1, !dbg !120
  %cmp = icmp ult i64 %5, %add, !dbg !121
  br i1 %cmp, label %for.body, label %for.end, !dbg !122

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !123
  %arrayidx1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !125
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !125
  %9 = load i8*, i8** %data, align 8, !dbg !126
  %10 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !126
  store i8 %8, i8* %arrayidx2, align 1, !dbg !128
  br label %for.inc, !dbg !129

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !130
  %inc = add i64 %11, 1, !dbg !130
  store i64 %inc, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !131, !llvm.loop !132

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !134
  call void @printLine(i8* %12), !dbg !135
  ret void, !dbg !136
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_01_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_01.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !4)
!18 = !DILocation(line: 30, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 12, scope: !13)
!21 = !DILocation(line: 31, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 32, type: !4)
!23 = !DILocation(line: 32, column: 12, scope: !13)
!24 = !DILocation(line: 32, column: 37, scope: !13)
!25 = !DILocation(line: 35, column: 12, scope: !13)
!26 = !DILocation(line: 35, column: 10, scope: !13)
!27 = !DILocation(line: 36, column: 5, scope: !13)
!28 = !DILocation(line: 36, column: 13, scope: !13)
!29 = !DILocalVariable(name: "source", scope: !30, file: !14, line: 38, type: !31)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 11)
!34 = !DILocation(line: 38, column: 14, scope: !30)
!35 = !DILocalVariable(name: "i", scope: !30, file: !14, line: 39, type: !36)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 46, baseType: !38)
!37 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 39, column: 16, scope: !30)
!40 = !DILocalVariable(name: "sourceLen", scope: !30, file: !14, line: 39, type: !36)
!41 = !DILocation(line: 39, column: 19, scope: !30)
!42 = !DILocation(line: 40, column: 28, scope: !30)
!43 = !DILocation(line: 40, column: 21, scope: !30)
!44 = !DILocation(line: 40, column: 19, scope: !30)
!45 = !DILocation(line: 43, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !30, file: !14, line: 43, column: 9)
!47 = !DILocation(line: 43, column: 14, scope: !46)
!48 = !DILocation(line: 43, column: 21, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !14, line: 43, column: 9)
!50 = !DILocation(line: 43, column: 25, scope: !49)
!51 = !DILocation(line: 43, column: 35, scope: !49)
!52 = !DILocation(line: 43, column: 23, scope: !49)
!53 = !DILocation(line: 43, column: 9, scope: !46)
!54 = !DILocation(line: 45, column: 30, scope: !55)
!55 = distinct !DILexicalBlock(scope: !49, file: !14, line: 44, column: 9)
!56 = !DILocation(line: 45, column: 23, scope: !55)
!57 = !DILocation(line: 45, column: 13, scope: !55)
!58 = !DILocation(line: 45, column: 18, scope: !55)
!59 = !DILocation(line: 45, column: 21, scope: !55)
!60 = !DILocation(line: 46, column: 9, scope: !55)
!61 = !DILocation(line: 43, column: 41, scope: !49)
!62 = !DILocation(line: 43, column: 9, scope: !49)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 46, column: 9, scope: !46)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 47, column: 19, scope: !30)
!67 = !DILocation(line: 47, column: 9, scope: !30)
!68 = !DILocation(line: 49, column: 1, scope: !13)
!69 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_01_good", scope: !14, file: !14, line: 79, type: !15, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 81, column: 5, scope: !69)
!71 = !DILocation(line: 82, column: 1, scope: !69)
!72 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 94, type: !73, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!75, !75, !76}
!75 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !14, line: 94, type: !75)
!78 = !DILocation(line: 94, column: 14, scope: !72)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !14, line: 94, type: !76)
!80 = !DILocation(line: 94, column: 27, scope: !72)
!81 = !DILocation(line: 97, column: 22, scope: !72)
!82 = !DILocation(line: 97, column: 12, scope: !72)
!83 = !DILocation(line: 97, column: 5, scope: !72)
!84 = !DILocation(line: 99, column: 5, scope: !72)
!85 = !DILocation(line: 100, column: 5, scope: !72)
!86 = !DILocation(line: 101, column: 5, scope: !72)
!87 = !DILocation(line: 104, column: 5, scope: !72)
!88 = !DILocation(line: 105, column: 5, scope: !72)
!89 = !DILocation(line: 106, column: 5, scope: !72)
!90 = !DILocation(line: 108, column: 5, scope: !72)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 56, type: !15, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !14, line: 58, type: !4)
!93 = !DILocation(line: 58, column: 12, scope: !91)
!94 = !DILocalVariable(name: "dataBadBuffer", scope: !91, file: !14, line: 59, type: !4)
!95 = !DILocation(line: 59, column: 12, scope: !91)
!96 = !DILocation(line: 59, column: 36, scope: !91)
!97 = !DILocalVariable(name: "dataGoodBuffer", scope: !91, file: !14, line: 60, type: !4)
!98 = !DILocation(line: 60, column: 12, scope: !91)
!99 = !DILocation(line: 60, column: 37, scope: !91)
!100 = !DILocation(line: 63, column: 12, scope: !91)
!101 = !DILocation(line: 63, column: 10, scope: !91)
!102 = !DILocation(line: 64, column: 5, scope: !91)
!103 = !DILocation(line: 64, column: 13, scope: !91)
!104 = !DILocalVariable(name: "source", scope: !105, file: !14, line: 66, type: !31)
!105 = distinct !DILexicalBlock(scope: !91, file: !14, line: 65, column: 5)
!106 = !DILocation(line: 66, column: 14, scope: !105)
!107 = !DILocalVariable(name: "i", scope: !105, file: !14, line: 67, type: !36)
!108 = !DILocation(line: 67, column: 16, scope: !105)
!109 = !DILocalVariable(name: "sourceLen", scope: !105, file: !14, line: 67, type: !36)
!110 = !DILocation(line: 67, column: 19, scope: !105)
!111 = !DILocation(line: 68, column: 28, scope: !105)
!112 = !DILocation(line: 68, column: 21, scope: !105)
!113 = !DILocation(line: 68, column: 19, scope: !105)
!114 = !DILocation(line: 71, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !105, file: !14, line: 71, column: 9)
!116 = !DILocation(line: 71, column: 14, scope: !115)
!117 = !DILocation(line: 71, column: 21, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !14, line: 71, column: 9)
!119 = !DILocation(line: 71, column: 25, scope: !118)
!120 = !DILocation(line: 71, column: 35, scope: !118)
!121 = !DILocation(line: 71, column: 23, scope: !118)
!122 = !DILocation(line: 71, column: 9, scope: !115)
!123 = !DILocation(line: 73, column: 30, scope: !124)
!124 = distinct !DILexicalBlock(scope: !118, file: !14, line: 72, column: 9)
!125 = !DILocation(line: 73, column: 23, scope: !124)
!126 = !DILocation(line: 73, column: 13, scope: !124)
!127 = !DILocation(line: 73, column: 18, scope: !124)
!128 = !DILocation(line: 73, column: 21, scope: !124)
!129 = !DILocation(line: 74, column: 9, scope: !124)
!130 = !DILocation(line: 71, column: 41, scope: !118)
!131 = !DILocation(line: 71, column: 9, scope: !118)
!132 = distinct !{!132, !122, !133, !65}
!133 = !DILocation(line: 74, column: 9, scope: !115)
!134 = !DILocation(line: 75, column: 19, scope: !105)
!135 = !DILocation(line: 75, column: 9, scope: !105)
!136 = !DILocation(line: 77, column: 1, scope: !91)
