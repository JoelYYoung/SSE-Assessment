; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.else, !dbg !31

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay, i8** %data, align 8, !dbg !34
  %0 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  br label %if.end, !dbg !37

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !38
  store i8* %arraydecay1, i8** %data, align 8, !dbg !40
  %1 = load i8*, i8** %data, align 8, !dbg !41
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 0, !dbg !41
  store i8 0, i8* %arrayidx2, align 1, !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !49, metadata !DIExpression()), !dbg !50
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 99, i1 false), !dbg !51
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx4, align 1, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !57
  %cmp = icmp ult i64 %2, 100, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !63
  %4 = load i8, i8* %arrayidx5, align 1, !dbg !63
  %5 = load i8*, i8** %data, align 8, !dbg !64
  %6 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx6 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !64
  store i8 %4, i8* %arrayidx6, align 1, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %7, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !73
  %arrayidx7 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !73
  store i8 0, i8* %arrayidx7, align 1, !dbg !74
  %9 = load i8*, i8** %data, align 8, !dbg !75
  call void @printLine(i8* %9), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_12_good() #0 !dbg !78 {
entry:
  call void @goodG2B(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #5, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #5, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_12_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_12_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !107
  %tobool = icmp ne i32 %call, 0, !dbg !107
  br i1 %tobool, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !110
  store i8* %arraydecay, i8** %data, align 8, !dbg !112
  %0 = load i8*, i8** %data, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !113
  store i8 0, i8* %arrayidx, align 1, !dbg !114
  br label %if.end, !dbg !115

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !116
  store i8* %arraydecay1, i8** %data, align 8, !dbg !118
  %1 = load i8*, i8** %data, align 8, !dbg !119
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 0, !dbg !119
  store i8 0, i8* %arrayidx2, align 1, !dbg !120
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !121, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !124, metadata !DIExpression()), !dbg !125
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 99, i1 false), !dbg !126
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !127
  store i8 0, i8* %arrayidx4, align 1, !dbg !128
  store i64 0, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !131

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !132
  %cmp = icmp ult i64 %2, 100, !dbg !134
  br i1 %cmp, label %for.body, label %for.end, !dbg !135

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !138
  %4 = load i8, i8* %arrayidx5, align 1, !dbg !138
  %5 = load i8*, i8** %data, align 8, !dbg !139
  %6 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx6 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !139
  store i8 %4, i8* %arrayidx6, align 1, !dbg !141
  br label %for.inc, !dbg !142

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !143
  %inc = add i64 %7, 1, !dbg !143
  store i64 %inc, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !144, !llvm.loop !145

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !147
  %arrayidx7 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !147
  store i8 0, i8* %arrayidx7, align 1, !dbg !148
  %9 = load i8*, i8** %data, align 8, !dbg !149
  call void @printLine(i8* %9), !dbg !150
  ret void, !dbg !151
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_12_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_12.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 27, column: 10, scope: !11)
!29 = !DILocation(line: 28, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!31 = !DILocation(line: 28, column: 8, scope: !11)
!32 = !DILocation(line: 32, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !12, line: 29, column: 5)
!34 = !DILocation(line: 32, column: 14, scope: !33)
!35 = !DILocation(line: 33, column: 9, scope: !33)
!36 = !DILocation(line: 33, column: 17, scope: !33)
!37 = !DILocation(line: 34, column: 5, scope: !33)
!38 = !DILocation(line: 38, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !30, file: !12, line: 36, column: 5)
!40 = !DILocation(line: 38, column: 14, scope: !39)
!41 = !DILocation(line: 39, column: 9, scope: !39)
!42 = !DILocation(line: 39, column: 17, scope: !39)
!43 = !DILocalVariable(name: "i", scope: !44, file: !12, line: 42, type: !45)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 42, column: 16, scope: !44)
!49 = !DILocalVariable(name: "source", scope: !44, file: !12, line: 43, type: !25)
!50 = !DILocation(line: 43, column: 14, scope: !44)
!51 = !DILocation(line: 44, column: 9, scope: !44)
!52 = !DILocation(line: 45, column: 9, scope: !44)
!53 = !DILocation(line: 45, column: 23, scope: !44)
!54 = !DILocation(line: 47, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !44, file: !12, line: 47, column: 9)
!56 = !DILocation(line: 47, column: 14, scope: !55)
!57 = !DILocation(line: 47, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !12, line: 47, column: 9)
!59 = !DILocation(line: 47, column: 23, scope: !58)
!60 = !DILocation(line: 47, column: 9, scope: !55)
!61 = !DILocation(line: 49, column: 30, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !12, line: 48, column: 9)
!63 = !DILocation(line: 49, column: 23, scope: !62)
!64 = !DILocation(line: 49, column: 13, scope: !62)
!65 = !DILocation(line: 49, column: 18, scope: !62)
!66 = !DILocation(line: 49, column: 21, scope: !62)
!67 = !DILocation(line: 50, column: 9, scope: !62)
!68 = !DILocation(line: 47, column: 31, scope: !58)
!69 = !DILocation(line: 47, column: 9, scope: !58)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 50, column: 9, scope: !55)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 51, column: 9, scope: !44)
!74 = !DILocation(line: 51, column: 21, scope: !44)
!75 = !DILocation(line: 52, column: 19, scope: !44)
!76 = !DILocation(line: 52, column: 9, scope: !44)
!77 = !DILocation(line: 54, column: 1, scope: !11)
!78 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_12_good", scope: !12, file: !12, line: 94, type: !13, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocation(line: 96, column: 5, scope: !78)
!80 = !DILocation(line: 97, column: 1, scope: !78)
!81 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 109, type: !82, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!84, !84, !85}
!84 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !12, line: 109, type: !84)
!87 = !DILocation(line: 109, column: 14, scope: !81)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !12, line: 109, type: !85)
!89 = !DILocation(line: 109, column: 27, scope: !81)
!90 = !DILocation(line: 112, column: 22, scope: !81)
!91 = !DILocation(line: 112, column: 12, scope: !81)
!92 = !DILocation(line: 112, column: 5, scope: !81)
!93 = !DILocation(line: 114, column: 5, scope: !81)
!94 = !DILocation(line: 115, column: 5, scope: !81)
!95 = !DILocation(line: 116, column: 5, scope: !81)
!96 = !DILocation(line: 119, column: 5, scope: !81)
!97 = !DILocation(line: 120, column: 5, scope: !81)
!98 = !DILocation(line: 121, column: 5, scope: !81)
!99 = !DILocation(line: 123, column: 5, scope: !81)
!100 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 62, type: !13, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !12, line: 64, type: !16)
!102 = !DILocation(line: 64, column: 12, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !12, line: 65, type: !20)
!104 = !DILocation(line: 65, column: 10, scope: !100)
!105 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !12, line: 66, type: !25)
!106 = !DILocation(line: 66, column: 10, scope: !100)
!107 = !DILocation(line: 67, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !100, file: !12, line: 67, column: 8)
!109 = !DILocation(line: 67, column: 8, scope: !100)
!110 = !DILocation(line: 70, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !12, line: 68, column: 5)
!112 = !DILocation(line: 70, column: 14, scope: !111)
!113 = !DILocation(line: 71, column: 9, scope: !111)
!114 = !DILocation(line: 71, column: 17, scope: !111)
!115 = !DILocation(line: 72, column: 5, scope: !111)
!116 = !DILocation(line: 76, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !108, file: !12, line: 74, column: 5)
!118 = !DILocation(line: 76, column: 14, scope: !117)
!119 = !DILocation(line: 77, column: 9, scope: !117)
!120 = !DILocation(line: 77, column: 17, scope: !117)
!121 = !DILocalVariable(name: "i", scope: !122, file: !12, line: 80, type: !45)
!122 = distinct !DILexicalBlock(scope: !100, file: !12, line: 79, column: 5)
!123 = !DILocation(line: 80, column: 16, scope: !122)
!124 = !DILocalVariable(name: "source", scope: !122, file: !12, line: 81, type: !25)
!125 = !DILocation(line: 81, column: 14, scope: !122)
!126 = !DILocation(line: 82, column: 9, scope: !122)
!127 = !DILocation(line: 83, column: 9, scope: !122)
!128 = !DILocation(line: 83, column: 23, scope: !122)
!129 = !DILocation(line: 85, column: 16, scope: !130)
!130 = distinct !DILexicalBlock(scope: !122, file: !12, line: 85, column: 9)
!131 = !DILocation(line: 85, column: 14, scope: !130)
!132 = !DILocation(line: 85, column: 21, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !12, line: 85, column: 9)
!134 = !DILocation(line: 85, column: 23, scope: !133)
!135 = !DILocation(line: 85, column: 9, scope: !130)
!136 = !DILocation(line: 87, column: 30, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !12, line: 86, column: 9)
!138 = !DILocation(line: 87, column: 23, scope: !137)
!139 = !DILocation(line: 87, column: 13, scope: !137)
!140 = !DILocation(line: 87, column: 18, scope: !137)
!141 = !DILocation(line: 87, column: 21, scope: !137)
!142 = !DILocation(line: 88, column: 9, scope: !137)
!143 = !DILocation(line: 85, column: 31, scope: !133)
!144 = !DILocation(line: 85, column: 9, scope: !133)
!145 = distinct !{!145, !135, !146, !72}
!146 = !DILocation(line: 88, column: 9, scope: !130)
!147 = !DILocation(line: 89, column: 9, scope: !122)
!148 = !DILocation(line: 89, column: 21, scope: !122)
!149 = !DILocation(line: 90, column: 19, scope: !122)
!150 = !DILocation(line: 90, column: 9, scope: !122)
!151 = !DILocation(line: 92, column: 1, scope: !100)
