; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_03.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_03_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !33, metadata !DIExpression()), !dbg !35
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !45
  %cmp = icmp ult i64 %1, 100, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !51
  %3 = load i32, i32* %arrayidx, align 4, !dbg !51
  %4 = load i32*, i32** %data, align 8, !dbg !52
  %5 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !52
  store i32 %3, i32* %arrayidx1, align 4, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !56
  %inc = add i64 %6, 1, !dbg !56
  store i64 %inc, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !61
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !61
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !61
  call void @printIntLine(i32 %8), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_03_good() #0 !dbg !64 {
entry:
  call void @goodG2B1(), !dbg !65
  call void @goodG2B2(), !dbg !66
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
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_03_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_03_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !95
  store i32* %arraydecay, i32** %data, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !101
  call void @llvm.dbg.declare(metadata i64* %i, metadata !102, metadata !DIExpression()), !dbg !104
  store i64 0, i64* %i, align 8, !dbg !105
  br label %for.cond, !dbg !107

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !108
  %cmp = icmp ult i64 %1, 100, !dbg !110
  br i1 %cmp, label %for.body, label %for.end, !dbg !111

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !112
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !114
  %3 = load i32, i32* %arrayidx, align 4, !dbg !114
  %4 = load i32*, i32** %data, align 8, !dbg !115
  %5 = load i64, i64* %i, align 8, !dbg !116
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !115
  store i32 %3, i32* %arrayidx1, align 4, !dbg !117
  br label %for.inc, !dbg !118

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !119
  %inc = add i64 %6, 1, !dbg !119
  store i64 %inc, i64* %i, align 8, !dbg !119
  br label %for.cond, !dbg !120, !llvm.loop !121

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !123
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !123
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !123
  call void @printIntLine(i32 %8), !dbg !124
  ret void, !dbg !125
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !126 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !127, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !131, metadata !DIExpression()), !dbg !132
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !133
  store i32* %arraydecay, i32** %data, align 8, !dbg !136
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !137, metadata !DIExpression()), !dbg !139
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !139
  call void @llvm.dbg.declare(metadata i64* %i, metadata !140, metadata !DIExpression()), !dbg !142
  store i64 0, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !146
  %cmp = icmp ult i64 %1, 100, !dbg !148
  br i1 %cmp, label %for.body, label %for.end, !dbg !149

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !152
  %3 = load i32, i32* %arrayidx, align 4, !dbg !152
  %4 = load i32*, i32** %data, align 8, !dbg !153
  %5 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !153
  store i32 %3, i32* %arrayidx1, align 4, !dbg !155
  br label %for.inc, !dbg !156

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !157
  %inc = add i64 %6, 1, !dbg !157
  store i64 %inc, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !158, !llvm.loop !159

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !161
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !161
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !161
  call void @printIntLine(i32 %8), !dbg !162
  ret void, !dbg !163
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_03.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_03_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_03.c", directory: "/root/SSE-Assessment")
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
!29 = !DILocation(line: 30, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !12, line: 27, column: 5)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 26, column: 8)
!32 = !DILocation(line: 30, column: 14, scope: !30)
!33 = !DILocalVariable(name: "source", scope: !34, file: !12, line: 33, type: !25)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!35 = !DILocation(line: 33, column: 13, scope: !34)
!36 = !DILocalVariable(name: "i", scope: !37, file: !12, line: 35, type: !38)
!37 = distinct !DILexicalBlock(scope: !34, file: !12, line: 34, column: 9)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 35, column: 20, scope: !37)
!42 = !DILocation(line: 37, column: 20, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !12, line: 37, column: 13)
!44 = !DILocation(line: 37, column: 18, scope: !43)
!45 = !DILocation(line: 37, column: 25, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !12, line: 37, column: 13)
!47 = !DILocation(line: 37, column: 27, scope: !46)
!48 = !DILocation(line: 37, column: 13, scope: !43)
!49 = !DILocation(line: 39, column: 34, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !12, line: 38, column: 13)
!51 = !DILocation(line: 39, column: 27, scope: !50)
!52 = !DILocation(line: 39, column: 17, scope: !50)
!53 = !DILocation(line: 39, column: 22, scope: !50)
!54 = !DILocation(line: 39, column: 25, scope: !50)
!55 = !DILocation(line: 40, column: 13, scope: !50)
!56 = !DILocation(line: 37, column: 35, scope: !46)
!57 = !DILocation(line: 37, column: 13, scope: !46)
!58 = distinct !{!58, !48, !59, !60}
!59 = !DILocation(line: 40, column: 13, scope: !43)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 41, column: 26, scope: !37)
!62 = !DILocation(line: 41, column: 13, scope: !37)
!63 = !DILocation(line: 44, column: 1, scope: !11)
!64 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_03_good", scope: !12, file: !12, line: 105, type: !13, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 107, column: 5, scope: !64)
!66 = !DILocation(line: 108, column: 5, scope: !64)
!67 = !DILocation(line: 109, column: 1, scope: !64)
!68 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 121, type: !69, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!17, !17, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !12, line: 121, type: !17)
!75 = !DILocation(line: 121, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !12, line: 121, type: !71)
!77 = !DILocation(line: 121, column: 27, scope: !68)
!78 = !DILocation(line: 124, column: 22, scope: !68)
!79 = !DILocation(line: 124, column: 12, scope: !68)
!80 = !DILocation(line: 124, column: 5, scope: !68)
!81 = !DILocation(line: 126, column: 5, scope: !68)
!82 = !DILocation(line: 127, column: 5, scope: !68)
!83 = !DILocation(line: 128, column: 5, scope: !68)
!84 = !DILocation(line: 131, column: 5, scope: !68)
!85 = !DILocation(line: 132, column: 5, scope: !68)
!86 = !DILocation(line: 133, column: 5, scope: !68)
!87 = !DILocation(line: 135, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !12, line: 53, type: !16)
!90 = !DILocation(line: 53, column: 11, scope: !88)
!91 = !DILocalVariable(name: "dataBadBuffer", scope: !88, file: !12, line: 54, type: !20)
!92 = !DILocation(line: 54, column: 9, scope: !88)
!93 = !DILocalVariable(name: "dataGoodBuffer", scope: !88, file: !12, line: 55, type: !25)
!94 = !DILocation(line: 55, column: 9, scope: !88)
!95 = !DILocation(line: 64, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !97, file: !12, line: 62, column: 5)
!97 = distinct !DILexicalBlock(scope: !88, file: !12, line: 56, column: 8)
!98 = !DILocation(line: 64, column: 14, scope: !96)
!99 = !DILocalVariable(name: "source", scope: !100, file: !12, line: 67, type: !25)
!100 = distinct !DILexicalBlock(scope: !88, file: !12, line: 66, column: 5)
!101 = !DILocation(line: 67, column: 13, scope: !100)
!102 = !DILocalVariable(name: "i", scope: !103, file: !12, line: 69, type: !38)
!103 = distinct !DILexicalBlock(scope: !100, file: !12, line: 68, column: 9)
!104 = !DILocation(line: 69, column: 20, scope: !103)
!105 = !DILocation(line: 71, column: 20, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !12, line: 71, column: 13)
!107 = !DILocation(line: 71, column: 18, scope: !106)
!108 = !DILocation(line: 71, column: 25, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !12, line: 71, column: 13)
!110 = !DILocation(line: 71, column: 27, scope: !109)
!111 = !DILocation(line: 71, column: 13, scope: !106)
!112 = !DILocation(line: 73, column: 34, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !12, line: 72, column: 13)
!114 = !DILocation(line: 73, column: 27, scope: !113)
!115 = !DILocation(line: 73, column: 17, scope: !113)
!116 = !DILocation(line: 73, column: 22, scope: !113)
!117 = !DILocation(line: 73, column: 25, scope: !113)
!118 = !DILocation(line: 74, column: 13, scope: !113)
!119 = !DILocation(line: 71, column: 35, scope: !109)
!120 = !DILocation(line: 71, column: 13, scope: !109)
!121 = distinct !{!121, !111, !122, !60}
!122 = !DILocation(line: 74, column: 13, scope: !106)
!123 = !DILocation(line: 75, column: 26, scope: !103)
!124 = !DILocation(line: 75, column: 13, scope: !103)
!125 = !DILocation(line: 78, column: 1, scope: !88)
!126 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!127 = !DILocalVariable(name: "data", scope: !126, file: !12, line: 83, type: !16)
!128 = !DILocation(line: 83, column: 11, scope: !126)
!129 = !DILocalVariable(name: "dataBadBuffer", scope: !126, file: !12, line: 84, type: !20)
!130 = !DILocation(line: 84, column: 9, scope: !126)
!131 = !DILocalVariable(name: "dataGoodBuffer", scope: !126, file: !12, line: 85, type: !25)
!132 = !DILocation(line: 85, column: 9, scope: !126)
!133 = !DILocation(line: 89, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !135, file: !12, line: 87, column: 5)
!135 = distinct !DILexicalBlock(scope: !126, file: !12, line: 86, column: 8)
!136 = !DILocation(line: 89, column: 14, scope: !134)
!137 = !DILocalVariable(name: "source", scope: !138, file: !12, line: 92, type: !25)
!138 = distinct !DILexicalBlock(scope: !126, file: !12, line: 91, column: 5)
!139 = !DILocation(line: 92, column: 13, scope: !138)
!140 = !DILocalVariable(name: "i", scope: !141, file: !12, line: 94, type: !38)
!141 = distinct !DILexicalBlock(scope: !138, file: !12, line: 93, column: 9)
!142 = !DILocation(line: 94, column: 20, scope: !141)
!143 = !DILocation(line: 96, column: 20, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !12, line: 96, column: 13)
!145 = !DILocation(line: 96, column: 18, scope: !144)
!146 = !DILocation(line: 96, column: 25, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !12, line: 96, column: 13)
!148 = !DILocation(line: 96, column: 27, scope: !147)
!149 = !DILocation(line: 96, column: 13, scope: !144)
!150 = !DILocation(line: 98, column: 34, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !12, line: 97, column: 13)
!152 = !DILocation(line: 98, column: 27, scope: !151)
!153 = !DILocation(line: 98, column: 17, scope: !151)
!154 = !DILocation(line: 98, column: 22, scope: !151)
!155 = !DILocation(line: 98, column: 25, scope: !151)
!156 = !DILocation(line: 99, column: 13, scope: !151)
!157 = !DILocation(line: 96, column: 35, scope: !147)
!158 = !DILocation(line: 96, column: 13, scope: !147)
!159 = distinct !{!159, !149, !160, !60}
!160 = !DILocation(line: 99, column: 13, scope: !144)
!161 = !DILocation(line: 100, column: 26, scope: !141)
!162 = !DILocation(line: 100, column: 13, scope: !141)
!163 = !DILocation(line: 103, column: 1, scope: !126)
