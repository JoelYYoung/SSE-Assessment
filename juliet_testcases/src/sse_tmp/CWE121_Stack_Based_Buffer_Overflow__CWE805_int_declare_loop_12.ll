; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.else, !dbg !31

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i32* %arraydecay, i32** %data, align 8, !dbg !34
  br label %if.end, !dbg !35

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !36
  store i32* %arraydecay1, i32** %data, align 8, !dbg !38
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !41
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !51
  %cmp = icmp ult i64 %1, 100, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !57
  %3 = load i32, i32* %arrayidx, align 4, !dbg !57
  %4 = load i32*, i32** %data, align 8, !dbg !58
  %5 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !58
  store i32 %3, i32* %arrayidx2, align 4, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %6, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !67
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !67
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !67
  call void @printIntLine(i32 %8), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_12_good() #0 !dbg !70 {
entry:
  call void @goodG2B(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #5, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #5, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_12_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_12_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !100
  %tobool = icmp ne i32 %call, 0, !dbg !100
  br i1 %tobool, label %if.then, label %if.else, !dbg !102

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !103
  store i32* %arraydecay, i32** %data, align 8, !dbg !105
  br label %if.end, !dbg !106

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !107
  store i32* %arraydecay1, i32** %data, align 8, !dbg !109
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !110, metadata !DIExpression()), !dbg !112
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !112
  call void @llvm.dbg.declare(metadata i64* %i, metadata !113, metadata !DIExpression()), !dbg !115
  store i64 0, i64* %i, align 8, !dbg !116
  br label %for.cond, !dbg !118

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !119
  %cmp = icmp ult i64 %1, 100, !dbg !121
  br i1 %cmp, label %for.body, label %for.end, !dbg !122

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !123
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !125
  %3 = load i32, i32* %arrayidx, align 4, !dbg !125
  %4 = load i32*, i32** %data, align 8, !dbg !126
  %5 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !126
  store i32 %3, i32* %arrayidx2, align 4, !dbg !128
  br label %for.inc, !dbg !129

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !130
  %inc = add i64 %6, 1, !dbg !130
  store i64 %inc, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !131, !llvm.loop !132

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !134
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !134
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !134
  call void @printIntLine(i32 %8), !dbg !135
  ret void, !dbg !136
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_12_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 23, column: 11, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 24, column: 9, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 25, column: 9, scope: !11)
!29 = !DILocation(line: 26, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 26, column: 8)
!31 = !DILocation(line: 26, column: 8, scope: !11)
!32 = !DILocation(line: 30, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !12, line: 27, column: 5)
!34 = !DILocation(line: 30, column: 14, scope: !33)
!35 = !DILocation(line: 31, column: 5, scope: !33)
!36 = !DILocation(line: 35, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !30, file: !12, line: 33, column: 5)
!38 = !DILocation(line: 35, column: 14, scope: !37)
!39 = !DILocalVariable(name: "source", scope: !40, file: !12, line: 38, type: !25)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!41 = !DILocation(line: 38, column: 13, scope: !40)
!42 = !DILocalVariable(name: "i", scope: !43, file: !12, line: 40, type: !44)
!43 = distinct !DILexicalBlock(scope: !40, file: !12, line: 39, column: 9)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 40, column: 20, scope: !43)
!48 = !DILocation(line: 42, column: 20, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !12, line: 42, column: 13)
!50 = !DILocation(line: 42, column: 18, scope: !49)
!51 = !DILocation(line: 42, column: 25, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !12, line: 42, column: 13)
!53 = !DILocation(line: 42, column: 27, scope: !52)
!54 = !DILocation(line: 42, column: 13, scope: !49)
!55 = !DILocation(line: 44, column: 34, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !12, line: 43, column: 13)
!57 = !DILocation(line: 44, column: 27, scope: !56)
!58 = !DILocation(line: 44, column: 17, scope: !56)
!59 = !DILocation(line: 44, column: 22, scope: !56)
!60 = !DILocation(line: 44, column: 25, scope: !56)
!61 = !DILocation(line: 45, column: 13, scope: !56)
!62 = !DILocation(line: 42, column: 35, scope: !52)
!63 = !DILocation(line: 42, column: 13, scope: !52)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 45, column: 13, scope: !49)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 46, column: 26, scope: !43)
!68 = !DILocation(line: 46, column: 13, scope: !43)
!69 = !DILocation(line: 49, column: 1, scope: !11)
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_12_good", scope: !12, file: !12, line: 86, type: !13, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 88, column: 5, scope: !70)
!72 = !DILocation(line: 89, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 101, type: !74, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!17, !17, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !12, line: 101, type: !17)
!80 = !DILocation(line: 101, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !12, line: 101, type: !76)
!82 = !DILocation(line: 101, column: 27, scope: !73)
!83 = !DILocation(line: 104, column: 22, scope: !73)
!84 = !DILocation(line: 104, column: 12, scope: !73)
!85 = !DILocation(line: 104, column: 5, scope: !73)
!86 = !DILocation(line: 106, column: 5, scope: !73)
!87 = !DILocation(line: 107, column: 5, scope: !73)
!88 = !DILocation(line: 108, column: 5, scope: !73)
!89 = !DILocation(line: 111, column: 5, scope: !73)
!90 = !DILocation(line: 112, column: 5, scope: !73)
!91 = !DILocation(line: 113, column: 5, scope: !73)
!92 = !DILocation(line: 115, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 57, type: !13, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !12, line: 59, type: !16)
!95 = !DILocation(line: 59, column: 11, scope: !93)
!96 = !DILocalVariable(name: "dataBadBuffer", scope: !93, file: !12, line: 60, type: !20)
!97 = !DILocation(line: 60, column: 9, scope: !93)
!98 = !DILocalVariable(name: "dataGoodBuffer", scope: !93, file: !12, line: 61, type: !25)
!99 = !DILocation(line: 61, column: 9, scope: !93)
!100 = !DILocation(line: 62, column: 8, scope: !101)
!101 = distinct !DILexicalBlock(scope: !93, file: !12, line: 62, column: 8)
!102 = !DILocation(line: 62, column: 8, scope: !93)
!103 = !DILocation(line: 65, column: 16, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !12, line: 63, column: 5)
!105 = !DILocation(line: 65, column: 14, scope: !104)
!106 = !DILocation(line: 66, column: 5, scope: !104)
!107 = !DILocation(line: 70, column: 16, scope: !108)
!108 = distinct !DILexicalBlock(scope: !101, file: !12, line: 68, column: 5)
!109 = !DILocation(line: 70, column: 14, scope: !108)
!110 = !DILocalVariable(name: "source", scope: !111, file: !12, line: 73, type: !25)
!111 = distinct !DILexicalBlock(scope: !93, file: !12, line: 72, column: 5)
!112 = !DILocation(line: 73, column: 13, scope: !111)
!113 = !DILocalVariable(name: "i", scope: !114, file: !12, line: 75, type: !44)
!114 = distinct !DILexicalBlock(scope: !111, file: !12, line: 74, column: 9)
!115 = !DILocation(line: 75, column: 20, scope: !114)
!116 = !DILocation(line: 77, column: 20, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !12, line: 77, column: 13)
!118 = !DILocation(line: 77, column: 18, scope: !117)
!119 = !DILocation(line: 77, column: 25, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !12, line: 77, column: 13)
!121 = !DILocation(line: 77, column: 27, scope: !120)
!122 = !DILocation(line: 77, column: 13, scope: !117)
!123 = !DILocation(line: 79, column: 34, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !12, line: 78, column: 13)
!125 = !DILocation(line: 79, column: 27, scope: !124)
!126 = !DILocation(line: 79, column: 17, scope: !124)
!127 = !DILocation(line: 79, column: 22, scope: !124)
!128 = !DILocation(line: 79, column: 25, scope: !124)
!129 = !DILocation(line: 80, column: 13, scope: !124)
!130 = !DILocation(line: 77, column: 35, scope: !120)
!131 = !DILocation(line: 77, column: 13, scope: !120)
!132 = distinct !{!132, !122, !133, !66}
!133 = !DILocation(line: 80, column: 13, scope: !117)
!134 = !DILocation(line: 81, column: 26, scope: !114)
!135 = !DILocation(line: 81, column: 13, scope: !114)
!136 = !DILocation(line: 84, column: 1, scope: !93)
