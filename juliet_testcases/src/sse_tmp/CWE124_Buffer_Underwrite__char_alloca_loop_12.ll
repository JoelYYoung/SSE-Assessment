; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_12.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_loop_12_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !23
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !24
  store i8 0, i8* %arrayidx, align 1, !dbg !25
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !26
  %tobool = icmp ne i32 %call, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.else, !dbg !28

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !31
  store i8* %add.ptr, i8** %data, align 8, !dbg !32
  br label %if.end, !dbg !33

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !34
  store i8* %4, i8** %data, align 8, !dbg !36
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !43, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !48
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !49
  store i8 0, i8* %arrayidx1, align 1, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !54
  %cmp = icmp ult i64 %5, 100, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %6, !dbg !60
  %7 = load i8, i8* %arrayidx2, align 1, !dbg !60
  %8 = load i8*, i8** %data, align 8, !dbg !61
  %9 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !61
  store i8 %7, i8* %arrayidx3, align 1, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %10, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %11 = load i8*, i8** %data, align 8, !dbg !70
  %arrayidx4 = getelementptr inbounds i8, i8* %11, i64 99, !dbg !70
  store i8 0, i8* %arrayidx4, align 1, !dbg !71
  %12 = load i8*, i8** %data, align 8, !dbg !72
  call void @printLine(i8* %12), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i32 @globalReturnsTrueOrFalse(...) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_loop_12_good() #0 !dbg !75 {
entry:
  call void @goodG2B(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #5, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #5, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE124_Buffer_Underwrite__char_alloca_loop_12_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE124_Buffer_Underwrite__char_alloca_loop_12_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = alloca i8, i64 100, align 16, !dbg !102
  store i8* %0, i8** %dataBuffer, align 8, !dbg !101
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !104
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !105
  store i8 0, i8* %arrayidx, align 1, !dbg !106
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !107
  %tobool = icmp ne i32 %call, 0, !dbg !107
  br i1 %tobool, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !110
  store i8* %3, i8** %data, align 8, !dbg !112
  br label %if.end, !dbg !113

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !114
  store i8* %4, i8** %data, align 8, !dbg !116
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !117, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !120, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !122
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !123
  store i8 0, i8* %arrayidx1, align 1, !dbg !124
  store i64 0, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !128
  %cmp = icmp ult i64 %5, 100, !dbg !130
  br i1 %cmp, label %for.body, label %for.end, !dbg !131

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %6, !dbg !134
  %7 = load i8, i8* %arrayidx2, align 1, !dbg !134
  %8 = load i8*, i8** %data, align 8, !dbg !135
  %9 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !135
  store i8 %7, i8* %arrayidx3, align 1, !dbg !137
  br label %for.inc, !dbg !138

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !139
  %inc = add i64 %10, 1, !dbg !139
  store i64 %inc, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !140, !llvm.loop !141

for.end:                                          ; preds = %for.cond
  %11 = load i8*, i8** %data, align 8, !dbg !143
  %arrayidx4 = getelementptr inbounds i8, i8* %11, i64 99, !dbg !143
  store i8 0, i8* %arrayidx4, align 1, !dbg !144
  %12 = load i8*, i8** %data, align 8, !dbg !145
  call void @printLine(i8* %12), !dbg !146
  ret void, !dbg !147
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_loop_12_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 5, scope: !13)
!24 = !DILocation(line: 28, column: 5, scope: !13)
!25 = !DILocation(line: 28, column: 23, scope: !13)
!26 = !DILocation(line: 29, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 8)
!28 = !DILocation(line: 29, column: 8, scope: !13)
!29 = !DILocation(line: 32, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !14, line: 30, column: 5)
!31 = !DILocation(line: 32, column: 27, scope: !30)
!32 = !DILocation(line: 32, column: 14, scope: !30)
!33 = !DILocation(line: 33, column: 5, scope: !30)
!34 = !DILocation(line: 37, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !27, file: !14, line: 35, column: 5)
!36 = !DILocation(line: 37, column: 14, scope: !35)
!37 = !DILocalVariable(name: "i", scope: !38, file: !14, line: 40, type: !39)
!38 = distinct !DILexicalBlock(scope: !13, file: !14, line: 39, column: 5)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 40, column: 16, scope: !38)
!43 = !DILocalVariable(name: "source", scope: !38, file: !14, line: 41, type: !44)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 41, column: 14, scope: !38)
!48 = !DILocation(line: 42, column: 9, scope: !38)
!49 = !DILocation(line: 43, column: 9, scope: !38)
!50 = !DILocation(line: 43, column: 23, scope: !38)
!51 = !DILocation(line: 45, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !38, file: !14, line: 45, column: 9)
!53 = !DILocation(line: 45, column: 14, scope: !52)
!54 = !DILocation(line: 45, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !14, line: 45, column: 9)
!56 = !DILocation(line: 45, column: 23, scope: !55)
!57 = !DILocation(line: 45, column: 9, scope: !52)
!58 = !DILocation(line: 47, column: 30, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !14, line: 46, column: 9)
!60 = !DILocation(line: 47, column: 23, scope: !59)
!61 = !DILocation(line: 47, column: 13, scope: !59)
!62 = !DILocation(line: 47, column: 18, scope: !59)
!63 = !DILocation(line: 47, column: 21, scope: !59)
!64 = !DILocation(line: 48, column: 9, scope: !59)
!65 = !DILocation(line: 45, column: 31, scope: !55)
!66 = !DILocation(line: 45, column: 9, scope: !55)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 48, column: 9, scope: !52)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 50, column: 9, scope: !38)
!71 = !DILocation(line: 50, column: 21, scope: !38)
!72 = !DILocation(line: 51, column: 19, scope: !38)
!73 = !DILocation(line: 51, column: 9, scope: !38)
!74 = !DILocation(line: 53, column: 1, scope: !13)
!75 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_loop_12_good", scope: !14, file: !14, line: 93, type: !15, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 95, column: 5, scope: !75)
!77 = !DILocation(line: 96, column: 1, scope: !75)
!78 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 108, type: !79, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!81, !81, !82}
!81 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !14, line: 108, type: !81)
!84 = !DILocation(line: 108, column: 14, scope: !78)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !14, line: 108, type: !82)
!86 = !DILocation(line: 108, column: 27, scope: !78)
!87 = !DILocation(line: 111, column: 22, scope: !78)
!88 = !DILocation(line: 111, column: 12, scope: !78)
!89 = !DILocation(line: 111, column: 5, scope: !78)
!90 = !DILocation(line: 113, column: 5, scope: !78)
!91 = !DILocation(line: 114, column: 5, scope: !78)
!92 = !DILocation(line: 115, column: 5, scope: !78)
!93 = !DILocation(line: 118, column: 5, scope: !78)
!94 = !DILocation(line: 119, column: 5, scope: !78)
!95 = !DILocation(line: 120, column: 5, scope: !78)
!96 = !DILocation(line: 122, column: 5, scope: !78)
!97 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 61, type: !15, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !14, line: 63, type: !4)
!99 = !DILocation(line: 63, column: 12, scope: !97)
!100 = !DILocalVariable(name: "dataBuffer", scope: !97, file: !14, line: 64, type: !4)
!101 = !DILocation(line: 64, column: 12, scope: !97)
!102 = !DILocation(line: 64, column: 33, scope: !97)
!103 = !DILocation(line: 65, column: 12, scope: !97)
!104 = !DILocation(line: 65, column: 5, scope: !97)
!105 = !DILocation(line: 66, column: 5, scope: !97)
!106 = !DILocation(line: 66, column: 23, scope: !97)
!107 = !DILocation(line: 67, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !97, file: !14, line: 67, column: 8)
!109 = !DILocation(line: 67, column: 8, scope: !97)
!110 = !DILocation(line: 70, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !14, line: 68, column: 5)
!112 = !DILocation(line: 70, column: 14, scope: !111)
!113 = !DILocation(line: 71, column: 5, scope: !111)
!114 = !DILocation(line: 75, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !108, file: !14, line: 73, column: 5)
!116 = !DILocation(line: 75, column: 14, scope: !115)
!117 = !DILocalVariable(name: "i", scope: !118, file: !14, line: 78, type: !39)
!118 = distinct !DILexicalBlock(scope: !97, file: !14, line: 77, column: 5)
!119 = !DILocation(line: 78, column: 16, scope: !118)
!120 = !DILocalVariable(name: "source", scope: !118, file: !14, line: 79, type: !44)
!121 = !DILocation(line: 79, column: 14, scope: !118)
!122 = !DILocation(line: 80, column: 9, scope: !118)
!123 = !DILocation(line: 81, column: 9, scope: !118)
!124 = !DILocation(line: 81, column: 23, scope: !118)
!125 = !DILocation(line: 83, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !118, file: !14, line: 83, column: 9)
!127 = !DILocation(line: 83, column: 14, scope: !126)
!128 = !DILocation(line: 83, column: 21, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !14, line: 83, column: 9)
!130 = !DILocation(line: 83, column: 23, scope: !129)
!131 = !DILocation(line: 83, column: 9, scope: !126)
!132 = !DILocation(line: 85, column: 30, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !14, line: 84, column: 9)
!134 = !DILocation(line: 85, column: 23, scope: !133)
!135 = !DILocation(line: 85, column: 13, scope: !133)
!136 = !DILocation(line: 85, column: 18, scope: !133)
!137 = !DILocation(line: 85, column: 21, scope: !133)
!138 = !DILocation(line: 86, column: 9, scope: !133)
!139 = !DILocation(line: 83, column: 31, scope: !129)
!140 = !DILocation(line: 83, column: 9, scope: !129)
!141 = distinct !{!141, !131, !142, !69}
!142 = !DILocation(line: 86, column: 9, scope: !126)
!143 = !DILocation(line: 88, column: 9, scope: !118)
!144 = !DILocation(line: 88, column: 21, scope: !118)
!145 = !DILocation(line: 89, column: 19, scope: !118)
!146 = !DILocation(line: 89, column: 9, scope: !118)
!147 = !DILocation(line: 91, column: 1, scope: !97)
