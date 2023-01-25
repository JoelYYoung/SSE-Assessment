; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_12_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 50, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.else, !dbg !27

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !28
  store i8* %2, i8** %data, align 8, !dbg !30
  %3 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  br label %if.end, !dbg !33

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !34
  store i8* %4, i8** %data, align 8, !dbg !36
  %5 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 0, !dbg !37
  store i8 0, i8* %arrayidx1, align 1, !dbg !38
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !45, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !50
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !51
  store i8 0, i8* %arrayidx2, align 1, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !56
  %cmp = icmp ult i64 %6, 100, !dbg !58
  br i1 %cmp, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %7, !dbg !62
  %8 = load i8, i8* %arrayidx3, align 1, !dbg !62
  %9 = load i8*, i8** %data, align 8, !dbg !63
  %10 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx4 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !63
  store i8 %8, i8* %arrayidx4, align 1, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %11, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !72
  %arrayidx5 = getelementptr inbounds i8, i8* %12, i64 99, !dbg !72
  store i8 0, i8* %arrayidx5, align 1, !dbg !73
  %13 = load i8*, i8** %data, align 8, !dbg !74
  call void @printLine(i8* %13), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_12_good() #0 !dbg !77 {
entry:
  call void @goodG2B(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #5, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #5, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_12_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_12_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = alloca i8, i64 50, align 16, !dbg !104
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %1 = alloca i8, i64 100, align 16, !dbg !107
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !106
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !108
  %tobool = icmp ne i32 %call, 0, !dbg !108
  br i1 %tobool, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !111
  store i8* %2, i8** %data, align 8, !dbg !113
  %3 = load i8*, i8** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  br label %if.end, !dbg !116

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !117
  store i8* %4, i8** %data, align 8, !dbg !119
  %5 = load i8*, i8** %data, align 8, !dbg !120
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 0, !dbg !120
  store i8 0, i8* %arrayidx1, align 1, !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !125, metadata !DIExpression()), !dbg !126
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !127
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !128
  store i8 0, i8* %arrayidx2, align 1, !dbg !129
  store i64 0, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !133
  %cmp = icmp ult i64 %6, 100, !dbg !135
  br i1 %cmp, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %7, !dbg !139
  %8 = load i8, i8* %arrayidx3, align 1, !dbg !139
  %9 = load i8*, i8** %data, align 8, !dbg !140
  %10 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx4 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !140
  store i8 %8, i8* %arrayidx4, align 1, !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !144
  %inc = add i64 %11, 1, !dbg !144
  store i64 %inc, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !148
  %arrayidx5 = getelementptr inbounds i8, i8* %12, i64 99, !dbg !148
  store i8 0, i8* %arrayidx5, align 1, !dbg !149
  %13 = load i8*, i8** %data, align 8, !dbg !150
  call void @printLine(i8* %13), !dbg !151
  ret void, !dbg !152
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_12_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !4)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 37, scope: !13)
!25 = !DILocation(line: 28, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 8)
!27 = !DILocation(line: 28, column: 8, scope: !13)
!28 = !DILocation(line: 32, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !14, line: 29, column: 5)
!30 = !DILocation(line: 32, column: 14, scope: !29)
!31 = !DILocation(line: 33, column: 9, scope: !29)
!32 = !DILocation(line: 33, column: 17, scope: !29)
!33 = !DILocation(line: 34, column: 5, scope: !29)
!34 = !DILocation(line: 38, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !26, file: !14, line: 36, column: 5)
!36 = !DILocation(line: 38, column: 14, scope: !35)
!37 = !DILocation(line: 39, column: 9, scope: !35)
!38 = !DILocation(line: 39, column: 17, scope: !35)
!39 = !DILocalVariable(name: "i", scope: !40, file: !14, line: 42, type: !41)
!40 = distinct !DILexicalBlock(scope: !13, file: !14, line: 41, column: 5)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 46, baseType: !43)
!42 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 42, column: 16, scope: !40)
!45 = !DILocalVariable(name: "source", scope: !40, file: !14, line: 43, type: !46)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 43, column: 14, scope: !40)
!50 = !DILocation(line: 44, column: 9, scope: !40)
!51 = !DILocation(line: 45, column: 9, scope: !40)
!52 = !DILocation(line: 45, column: 23, scope: !40)
!53 = !DILocation(line: 47, column: 16, scope: !54)
!54 = distinct !DILexicalBlock(scope: !40, file: !14, line: 47, column: 9)
!55 = !DILocation(line: 47, column: 14, scope: !54)
!56 = !DILocation(line: 47, column: 21, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !14, line: 47, column: 9)
!58 = !DILocation(line: 47, column: 23, scope: !57)
!59 = !DILocation(line: 47, column: 9, scope: !54)
!60 = !DILocation(line: 49, column: 30, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !14, line: 48, column: 9)
!62 = !DILocation(line: 49, column: 23, scope: !61)
!63 = !DILocation(line: 49, column: 13, scope: !61)
!64 = !DILocation(line: 49, column: 18, scope: !61)
!65 = !DILocation(line: 49, column: 21, scope: !61)
!66 = !DILocation(line: 50, column: 9, scope: !61)
!67 = !DILocation(line: 47, column: 31, scope: !57)
!68 = !DILocation(line: 47, column: 9, scope: !57)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 50, column: 9, scope: !54)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 51, column: 9, scope: !40)
!73 = !DILocation(line: 51, column: 21, scope: !40)
!74 = !DILocation(line: 52, column: 19, scope: !40)
!75 = !DILocation(line: 52, column: 9, scope: !40)
!76 = !DILocation(line: 54, column: 1, scope: !13)
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_12_good", scope: !14, file: !14, line: 94, type: !15, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 96, column: 5, scope: !77)
!79 = !DILocation(line: 97, column: 1, scope: !77)
!80 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 109, type: !81, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!83, !83, !84}
!83 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !14, line: 109, type: !83)
!86 = !DILocation(line: 109, column: 14, scope: !80)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !14, line: 109, type: !84)
!88 = !DILocation(line: 109, column: 27, scope: !80)
!89 = !DILocation(line: 112, column: 22, scope: !80)
!90 = !DILocation(line: 112, column: 12, scope: !80)
!91 = !DILocation(line: 112, column: 5, scope: !80)
!92 = !DILocation(line: 114, column: 5, scope: !80)
!93 = !DILocation(line: 115, column: 5, scope: !80)
!94 = !DILocation(line: 116, column: 5, scope: !80)
!95 = !DILocation(line: 119, column: 5, scope: !80)
!96 = !DILocation(line: 120, column: 5, scope: !80)
!97 = !DILocation(line: 121, column: 5, scope: !80)
!98 = !DILocation(line: 123, column: 5, scope: !80)
!99 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 62, type: !15, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !14, line: 64, type: !4)
!101 = !DILocation(line: 64, column: 12, scope: !99)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !99, file: !14, line: 65, type: !4)
!103 = !DILocation(line: 65, column: 12, scope: !99)
!104 = !DILocation(line: 65, column: 36, scope: !99)
!105 = !DILocalVariable(name: "dataGoodBuffer", scope: !99, file: !14, line: 66, type: !4)
!106 = !DILocation(line: 66, column: 12, scope: !99)
!107 = !DILocation(line: 66, column: 37, scope: !99)
!108 = !DILocation(line: 67, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !99, file: !14, line: 67, column: 8)
!110 = !DILocation(line: 67, column: 8, scope: !99)
!111 = !DILocation(line: 70, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !14, line: 68, column: 5)
!113 = !DILocation(line: 70, column: 14, scope: !112)
!114 = !DILocation(line: 71, column: 9, scope: !112)
!115 = !DILocation(line: 71, column: 17, scope: !112)
!116 = !DILocation(line: 72, column: 5, scope: !112)
!117 = !DILocation(line: 76, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !109, file: !14, line: 74, column: 5)
!119 = !DILocation(line: 76, column: 14, scope: !118)
!120 = !DILocation(line: 77, column: 9, scope: !118)
!121 = !DILocation(line: 77, column: 17, scope: !118)
!122 = !DILocalVariable(name: "i", scope: !123, file: !14, line: 80, type: !41)
!123 = distinct !DILexicalBlock(scope: !99, file: !14, line: 79, column: 5)
!124 = !DILocation(line: 80, column: 16, scope: !123)
!125 = !DILocalVariable(name: "source", scope: !123, file: !14, line: 81, type: !46)
!126 = !DILocation(line: 81, column: 14, scope: !123)
!127 = !DILocation(line: 82, column: 9, scope: !123)
!128 = !DILocation(line: 83, column: 9, scope: !123)
!129 = !DILocation(line: 83, column: 23, scope: !123)
!130 = !DILocation(line: 85, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !123, file: !14, line: 85, column: 9)
!132 = !DILocation(line: 85, column: 14, scope: !131)
!133 = !DILocation(line: 85, column: 21, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !14, line: 85, column: 9)
!135 = !DILocation(line: 85, column: 23, scope: !134)
!136 = !DILocation(line: 85, column: 9, scope: !131)
!137 = !DILocation(line: 87, column: 30, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !14, line: 86, column: 9)
!139 = !DILocation(line: 87, column: 23, scope: !138)
!140 = !DILocation(line: 87, column: 13, scope: !138)
!141 = !DILocation(line: 87, column: 18, scope: !138)
!142 = !DILocation(line: 87, column: 21, scope: !138)
!143 = !DILocation(line: 88, column: 9, scope: !138)
!144 = !DILocation(line: 85, column: 31, scope: !134)
!145 = !DILocation(line: 85, column: 9, scope: !134)
!146 = distinct !{!146, !136, !147, !71}
!147 = !DILocation(line: 88, column: 9, scope: !131)
!148 = !DILocation(line: 89, column: 9, scope: !123)
!149 = !DILocation(line: 89, column: 21, scope: !123)
!150 = !DILocation(line: 90, column: 19, scope: !123)
!151 = !DILocation(line: 90, column: 9, scope: !123)
!152 = !DILocation(line: 92, column: 1, scope: !99)
