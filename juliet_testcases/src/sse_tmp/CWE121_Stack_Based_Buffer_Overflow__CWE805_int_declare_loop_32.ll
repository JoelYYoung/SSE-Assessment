; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !34, metadata !DIExpression()), !dbg !36
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !37
  %1 = load i32*, i32** %0, align 8, !dbg !38
  store i32* %1, i32** %data1, align 8, !dbg !36
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i32* %arraydecay, i32** %data1, align 8, !dbg !40
  %2 = load i32*, i32** %data1, align 8, !dbg !41
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !42
  store i32* %2, i32** %3, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !44, metadata !DIExpression()), !dbg !46
  %4 = load i32**, i32*** %dataPtr2, align 8, !dbg !47
  %5 = load i32*, i32** %4, align 8, !dbg !48
  store i32* %5, i32** %data2, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !49, metadata !DIExpression()), !dbg !51
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %i, metadata !52, metadata !DIExpression()), !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !61
  %cmp = icmp ult i64 %7, 100, !dbg !63
  br i1 %cmp, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !67
  %9 = load i32, i32* %arrayidx, align 4, !dbg !67
  %10 = load i32*, i32** %data2, align 8, !dbg !68
  %11 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !68
  store i32 %9, i32* %arrayidx3, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %12, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data2, align 8, !dbg !77
  %arrayidx4 = getelementptr inbounds i32, i32* %13, i64 0, !dbg !77
  %14 = load i32, i32* %arrayidx4, align 4, !dbg !77
  call void @printIntLine(i32 %14), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_32_good() #0 !dbg !80 {
entry:
  call void @goodG2B(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #5, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #5, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_32_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_32_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !106, metadata !DIExpression()), !dbg !107
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !108, metadata !DIExpression()), !dbg !109
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !114, metadata !DIExpression()), !dbg !116
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !117
  %1 = load i32*, i32** %0, align 8, !dbg !118
  store i32* %1, i32** %data1, align 8, !dbg !116
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !119
  store i32* %arraydecay, i32** %data1, align 8, !dbg !120
  %2 = load i32*, i32** %data1, align 8, !dbg !121
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !122
  store i32* %2, i32** %3, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !124, metadata !DIExpression()), !dbg !126
  %4 = load i32**, i32*** %dataPtr2, align 8, !dbg !127
  %5 = load i32*, i32** %4, align 8, !dbg !128
  store i32* %5, i32** %data2, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !129, metadata !DIExpression()), !dbg !131
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !131
  call void @llvm.dbg.declare(metadata i64* %i, metadata !132, metadata !DIExpression()), !dbg !134
  store i64 0, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !138
  %cmp = icmp ult i64 %7, 100, !dbg !140
  br i1 %cmp, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !144
  %9 = load i32, i32* %arrayidx, align 4, !dbg !144
  %10 = load i32*, i32** %data2, align 8, !dbg !145
  %11 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !145
  store i32 %9, i32* %arrayidx3, align 4, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !149
  %inc = add i64 %12, 1, !dbg !149
  store i64 %inc, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data2, align 8, !dbg !153
  %arrayidx4 = getelementptr inbounds i32, i32* %13, i64 0, !dbg !153
  %14 = load i32, i32* %arrayidx4, align 4, !dbg !153
  call void @printIntLine(i32 %14), !dbg !154
  ret void, !dbg !155
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_32_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_32.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 23, column: 11, scope: !11)
!19 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 24, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!21 = !DILocation(line: 24, column: 12, scope: !11)
!22 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 25, type: !20)
!23 = !DILocation(line: 25, column: 12, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 26, column: 9, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 27, column: 9, scope: !11)
!34 = !DILocalVariable(name: "data", scope: !35, file: !12, line: 29, type: !16)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 5)
!36 = !DILocation(line: 29, column: 15, scope: !35)
!37 = !DILocation(line: 29, column: 23, scope: !35)
!38 = !DILocation(line: 29, column: 22, scope: !35)
!39 = !DILocation(line: 32, column: 16, scope: !35)
!40 = !DILocation(line: 32, column: 14, scope: !35)
!41 = !DILocation(line: 33, column: 21, scope: !35)
!42 = !DILocation(line: 33, column: 10, scope: !35)
!43 = !DILocation(line: 33, column: 19, scope: !35)
!44 = !DILocalVariable(name: "data", scope: !45, file: !12, line: 36, type: !16)
!45 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!46 = !DILocation(line: 36, column: 15, scope: !45)
!47 = !DILocation(line: 36, column: 23, scope: !45)
!48 = !DILocation(line: 36, column: 22, scope: !45)
!49 = !DILocalVariable(name: "source", scope: !50, file: !12, line: 38, type: !30)
!50 = distinct !DILexicalBlock(scope: !45, file: !12, line: 37, column: 9)
!51 = !DILocation(line: 38, column: 17, scope: !50)
!52 = !DILocalVariable(name: "i", scope: !53, file: !12, line: 40, type: !54)
!53 = distinct !DILexicalBlock(scope: !50, file: !12, line: 39, column: 13)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !55, line: 46, baseType: !56)
!55 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!56 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!57 = !DILocation(line: 40, column: 24, scope: !53)
!58 = !DILocation(line: 42, column: 24, scope: !59)
!59 = distinct !DILexicalBlock(scope: !53, file: !12, line: 42, column: 17)
!60 = !DILocation(line: 42, column: 22, scope: !59)
!61 = !DILocation(line: 42, column: 29, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !12, line: 42, column: 17)
!63 = !DILocation(line: 42, column: 31, scope: !62)
!64 = !DILocation(line: 42, column: 17, scope: !59)
!65 = !DILocation(line: 44, column: 38, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !12, line: 43, column: 17)
!67 = !DILocation(line: 44, column: 31, scope: !66)
!68 = !DILocation(line: 44, column: 21, scope: !66)
!69 = !DILocation(line: 44, column: 26, scope: !66)
!70 = !DILocation(line: 44, column: 29, scope: !66)
!71 = !DILocation(line: 45, column: 17, scope: !66)
!72 = !DILocation(line: 42, column: 39, scope: !62)
!73 = !DILocation(line: 42, column: 17, scope: !62)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 45, column: 17, scope: !59)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 46, column: 30, scope: !53)
!78 = !DILocation(line: 46, column: 17, scope: !53)
!79 = !DILocation(line: 50, column: 1, scope: !11)
!80 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_32_good", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 89, column: 5, scope: !80)
!82 = !DILocation(line: 90, column: 1, scope: !80)
!83 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 101, type: !84, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!17, !17, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !12, line: 101, type: !17)
!90 = !DILocation(line: 101, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !12, line: 101, type: !86)
!92 = !DILocation(line: 101, column: 27, scope: !83)
!93 = !DILocation(line: 104, column: 22, scope: !83)
!94 = !DILocation(line: 104, column: 12, scope: !83)
!95 = !DILocation(line: 104, column: 5, scope: !83)
!96 = !DILocation(line: 106, column: 5, scope: !83)
!97 = !DILocation(line: 107, column: 5, scope: !83)
!98 = !DILocation(line: 108, column: 5, scope: !83)
!99 = !DILocation(line: 111, column: 5, scope: !83)
!100 = !DILocation(line: 112, column: 5, scope: !83)
!101 = !DILocation(line: 113, column: 5, scope: !83)
!102 = !DILocation(line: 115, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 57, type: !13, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 59, type: !16)
!105 = !DILocation(line: 59, column: 11, scope: !103)
!106 = !DILocalVariable(name: "dataPtr1", scope: !103, file: !12, line: 60, type: !20)
!107 = !DILocation(line: 60, column: 12, scope: !103)
!108 = !DILocalVariable(name: "dataPtr2", scope: !103, file: !12, line: 61, type: !20)
!109 = !DILocation(line: 61, column: 12, scope: !103)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !12, line: 62, type: !25)
!111 = !DILocation(line: 62, column: 9, scope: !103)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !12, line: 63, type: !30)
!113 = !DILocation(line: 63, column: 9, scope: !103)
!114 = !DILocalVariable(name: "data", scope: !115, file: !12, line: 65, type: !16)
!115 = distinct !DILexicalBlock(scope: !103, file: !12, line: 64, column: 5)
!116 = !DILocation(line: 65, column: 15, scope: !115)
!117 = !DILocation(line: 65, column: 23, scope: !115)
!118 = !DILocation(line: 65, column: 22, scope: !115)
!119 = !DILocation(line: 67, column: 16, scope: !115)
!120 = !DILocation(line: 67, column: 14, scope: !115)
!121 = !DILocation(line: 68, column: 21, scope: !115)
!122 = !DILocation(line: 68, column: 10, scope: !115)
!123 = !DILocation(line: 68, column: 19, scope: !115)
!124 = !DILocalVariable(name: "data", scope: !125, file: !12, line: 71, type: !16)
!125 = distinct !DILexicalBlock(scope: !103, file: !12, line: 70, column: 5)
!126 = !DILocation(line: 71, column: 15, scope: !125)
!127 = !DILocation(line: 71, column: 23, scope: !125)
!128 = !DILocation(line: 71, column: 22, scope: !125)
!129 = !DILocalVariable(name: "source", scope: !130, file: !12, line: 73, type: !30)
!130 = distinct !DILexicalBlock(scope: !125, file: !12, line: 72, column: 9)
!131 = !DILocation(line: 73, column: 17, scope: !130)
!132 = !DILocalVariable(name: "i", scope: !133, file: !12, line: 75, type: !54)
!133 = distinct !DILexicalBlock(scope: !130, file: !12, line: 74, column: 13)
!134 = !DILocation(line: 75, column: 24, scope: !133)
!135 = !DILocation(line: 77, column: 24, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !12, line: 77, column: 17)
!137 = !DILocation(line: 77, column: 22, scope: !136)
!138 = !DILocation(line: 77, column: 29, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !12, line: 77, column: 17)
!140 = !DILocation(line: 77, column: 31, scope: !139)
!141 = !DILocation(line: 77, column: 17, scope: !136)
!142 = !DILocation(line: 79, column: 38, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !12, line: 78, column: 17)
!144 = !DILocation(line: 79, column: 31, scope: !143)
!145 = !DILocation(line: 79, column: 21, scope: !143)
!146 = !DILocation(line: 79, column: 26, scope: !143)
!147 = !DILocation(line: 79, column: 29, scope: !143)
!148 = !DILocation(line: 80, column: 17, scope: !143)
!149 = !DILocation(line: 77, column: 39, scope: !139)
!150 = !DILocation(line: 77, column: 17, scope: !139)
!151 = distinct !{!151, !141, !152, !76}
!152 = !DILocation(line: 80, column: 17, scope: !136)
!153 = !DILocation(line: 81, column: 30, scope: !133)
!154 = !DILocation(line: 81, column: 17, scope: !133)
!155 = !DILocation(line: 85, column: 1, scope: !103)
