; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_32_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 50, align 16, !dbg !26
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 100, align 16, !dbg !29
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !30, metadata !DIExpression()), !dbg !32
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !33
  %3 = load i8*, i8** %2, align 8, !dbg !34
  store i8* %3, i8** %data1, align 8, !dbg !32
  %4 = load i8*, i8** %dataBadBuffer, align 8, !dbg !35
  store i8* %4, i8** %data1, align 8, !dbg !36
  %5 = load i8*, i8** %data1, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 0, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %6 = load i8*, i8** %data1, align 8, !dbg !39
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !40
  store i8* %6, i8** %7, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !42, metadata !DIExpression()), !dbg !44
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !45
  %9 = load i8*, i8** %8, align 8, !dbg !46
  store i8* %9, i8** %data2, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !53, metadata !DIExpression()), !dbg !57
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !58
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !58
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !59
  store i8 0, i8* %arrayidx3, align 1, !dbg !60
  store i64 0, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %entry
  %10 = load i64, i64* %i, align 8, !dbg !64
  %cmp = icmp ult i64 %10, 100, !dbg !66
  br i1 %cmp, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %11 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %11, !dbg !70
  %12 = load i8, i8* %arrayidx4, align 1, !dbg !70
  %13 = load i8*, i8** %data2, align 8, !dbg !71
  %14 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx5 = getelementptr inbounds i8, i8* %13, i64 %14, !dbg !71
  store i8 %12, i8* %arrayidx5, align 1, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %15, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %16 = load i8*, i8** %data2, align 8, !dbg !80
  %arrayidx6 = getelementptr inbounds i8, i8* %16, i64 99, !dbg !80
  store i8 0, i8* %arrayidx6, align 1, !dbg !81
  %17 = load i8*, i8** %data2, align 8, !dbg !82
  call void @printLine(i8* %17), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_32_good() #0 !dbg !85 {
entry:
  call void @goodG2B(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #5, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #5, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_32_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_32_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !109, metadata !DIExpression()), !dbg !110
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !111, metadata !DIExpression()), !dbg !112
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = alloca i8, i64 50, align 16, !dbg !115
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %1 = alloca i8, i64 100, align 16, !dbg !118
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !119, metadata !DIExpression()), !dbg !121
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !122
  %3 = load i8*, i8** %2, align 8, !dbg !123
  store i8* %3, i8** %data1, align 8, !dbg !121
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !124
  store i8* %4, i8** %data1, align 8, !dbg !125
  %5 = load i8*, i8** %data1, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 0, !dbg !126
  store i8 0, i8* %arrayidx, align 1, !dbg !127
  %6 = load i8*, i8** %data1, align 8, !dbg !128
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !129
  store i8* %6, i8** %7, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !131, metadata !DIExpression()), !dbg !133
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !134
  %9 = load i8*, i8** %8, align 8, !dbg !135
  store i8* %9, i8** %data2, align 8, !dbg !133
  call void @llvm.dbg.declare(metadata i64* %i, metadata !136, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !139, metadata !DIExpression()), !dbg !140
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !141
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !141
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !142
  store i8 0, i8* %arrayidx3, align 1, !dbg !143
  store i64 0, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !146

for.cond:                                         ; preds = %for.inc, %entry
  %10 = load i64, i64* %i, align 8, !dbg !147
  %cmp = icmp ult i64 %10, 100, !dbg !149
  br i1 %cmp, label %for.body, label %for.end, !dbg !150

for.body:                                         ; preds = %for.cond
  %11 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %11, !dbg !153
  %12 = load i8, i8* %arrayidx4, align 1, !dbg !153
  %13 = load i8*, i8** %data2, align 8, !dbg !154
  %14 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx5 = getelementptr inbounds i8, i8* %13, i64 %14, !dbg !154
  store i8 %12, i8* %arrayidx5, align 1, !dbg !156
  br label %for.inc, !dbg !157

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !158
  %inc = add i64 %15, 1, !dbg !158
  store i64 %inc, i64* %i, align 8, !dbg !158
  br label %for.cond, !dbg !159, !llvm.loop !160

for.end:                                          ; preds = %for.cond
  %16 = load i8*, i8** %data2, align 8, !dbg !162
  %arrayidx6 = getelementptr inbounds i8, i8* %16, i64 99, !dbg !162
  store i8 0, i8* %arrayidx6, align 1, !dbg !163
  %17 = load i8*, i8** %data2, align 8, !dbg !164
  call void @printLine(i8* %17), !dbg !165
  ret void, !dbg !166
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_32_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataPtr1", scope: !13, file: !14, line: 26, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!21 = !DILocation(line: 26, column: 13, scope: !13)
!22 = !DILocalVariable(name: "dataPtr2", scope: !13, file: !14, line: 27, type: !20)
!23 = !DILocation(line: 27, column: 13, scope: !13)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 28, type: !4)
!25 = !DILocation(line: 28, column: 12, scope: !13)
!26 = !DILocation(line: 28, column: 36, scope: !13)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 29, type: !4)
!28 = !DILocation(line: 29, column: 12, scope: !13)
!29 = !DILocation(line: 29, column: 37, scope: !13)
!30 = !DILocalVariable(name: "data", scope: !31, file: !14, line: 31, type: !4)
!31 = distinct !DILexicalBlock(scope: !13, file: !14, line: 30, column: 5)
!32 = !DILocation(line: 31, column: 16, scope: !31)
!33 = !DILocation(line: 31, column: 24, scope: !31)
!34 = !DILocation(line: 31, column: 23, scope: !31)
!35 = !DILocation(line: 34, column: 16, scope: !31)
!36 = !DILocation(line: 34, column: 14, scope: !31)
!37 = !DILocation(line: 35, column: 9, scope: !31)
!38 = !DILocation(line: 35, column: 17, scope: !31)
!39 = !DILocation(line: 36, column: 21, scope: !31)
!40 = !DILocation(line: 36, column: 10, scope: !31)
!41 = !DILocation(line: 36, column: 19, scope: !31)
!42 = !DILocalVariable(name: "data", scope: !43, file: !14, line: 39, type: !4)
!43 = distinct !DILexicalBlock(scope: !13, file: !14, line: 38, column: 5)
!44 = !DILocation(line: 39, column: 16, scope: !43)
!45 = !DILocation(line: 39, column: 24, scope: !43)
!46 = !DILocation(line: 39, column: 23, scope: !43)
!47 = !DILocalVariable(name: "i", scope: !48, file: !14, line: 41, type: !49)
!48 = distinct !DILexicalBlock(scope: !43, file: !14, line: 40, column: 9)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !50, line: 46, baseType: !51)
!50 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 41, column: 20, scope: !48)
!53 = !DILocalVariable(name: "source", scope: !48, file: !14, line: 42, type: !54)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 100)
!57 = !DILocation(line: 42, column: 18, scope: !48)
!58 = !DILocation(line: 43, column: 13, scope: !48)
!59 = !DILocation(line: 44, column: 13, scope: !48)
!60 = !DILocation(line: 44, column: 27, scope: !48)
!61 = !DILocation(line: 46, column: 20, scope: !62)
!62 = distinct !DILexicalBlock(scope: !48, file: !14, line: 46, column: 13)
!63 = !DILocation(line: 46, column: 18, scope: !62)
!64 = !DILocation(line: 46, column: 25, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !14, line: 46, column: 13)
!66 = !DILocation(line: 46, column: 27, scope: !65)
!67 = !DILocation(line: 46, column: 13, scope: !62)
!68 = !DILocation(line: 48, column: 34, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !14, line: 47, column: 13)
!70 = !DILocation(line: 48, column: 27, scope: !69)
!71 = !DILocation(line: 48, column: 17, scope: !69)
!72 = !DILocation(line: 48, column: 22, scope: !69)
!73 = !DILocation(line: 48, column: 25, scope: !69)
!74 = !DILocation(line: 49, column: 13, scope: !69)
!75 = !DILocation(line: 46, column: 35, scope: !65)
!76 = !DILocation(line: 46, column: 13, scope: !65)
!77 = distinct !{!77, !67, !78, !79}
!78 = !DILocation(line: 49, column: 13, scope: !62)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 50, column: 13, scope: !48)
!81 = !DILocation(line: 50, column: 25, scope: !48)
!82 = !DILocation(line: 51, column: 23, scope: !48)
!83 = !DILocation(line: 51, column: 13, scope: !48)
!84 = !DILocation(line: 54, column: 1, scope: !13)
!85 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_32_good", scope: !14, file: !14, line: 93, type: !15, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 95, column: 5, scope: !85)
!87 = !DILocation(line: 96, column: 1, scope: !85)
!88 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 107, type: !89, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!91, !91, !20}
!91 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !14, line: 107, type: !91)
!93 = !DILocation(line: 107, column: 14, scope: !88)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !14, line: 107, type: !20)
!95 = !DILocation(line: 107, column: 27, scope: !88)
!96 = !DILocation(line: 110, column: 22, scope: !88)
!97 = !DILocation(line: 110, column: 12, scope: !88)
!98 = !DILocation(line: 110, column: 5, scope: !88)
!99 = !DILocation(line: 112, column: 5, scope: !88)
!100 = !DILocation(line: 113, column: 5, scope: !88)
!101 = !DILocation(line: 114, column: 5, scope: !88)
!102 = !DILocation(line: 117, column: 5, scope: !88)
!103 = !DILocation(line: 118, column: 5, scope: !88)
!104 = !DILocation(line: 119, column: 5, scope: !88)
!105 = !DILocation(line: 121, column: 5, scope: !88)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 61, type: !15, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !14, line: 63, type: !4)
!108 = !DILocation(line: 63, column: 12, scope: !106)
!109 = !DILocalVariable(name: "dataPtr1", scope: !106, file: !14, line: 64, type: !20)
!110 = !DILocation(line: 64, column: 13, scope: !106)
!111 = !DILocalVariable(name: "dataPtr2", scope: !106, file: !14, line: 65, type: !20)
!112 = !DILocation(line: 65, column: 13, scope: !106)
!113 = !DILocalVariable(name: "dataBadBuffer", scope: !106, file: !14, line: 66, type: !4)
!114 = !DILocation(line: 66, column: 12, scope: !106)
!115 = !DILocation(line: 66, column: 36, scope: !106)
!116 = !DILocalVariable(name: "dataGoodBuffer", scope: !106, file: !14, line: 67, type: !4)
!117 = !DILocation(line: 67, column: 12, scope: !106)
!118 = !DILocation(line: 67, column: 37, scope: !106)
!119 = !DILocalVariable(name: "data", scope: !120, file: !14, line: 69, type: !4)
!120 = distinct !DILexicalBlock(scope: !106, file: !14, line: 68, column: 5)
!121 = !DILocation(line: 69, column: 16, scope: !120)
!122 = !DILocation(line: 69, column: 24, scope: !120)
!123 = !DILocation(line: 69, column: 23, scope: !120)
!124 = !DILocation(line: 71, column: 16, scope: !120)
!125 = !DILocation(line: 71, column: 14, scope: !120)
!126 = !DILocation(line: 72, column: 9, scope: !120)
!127 = !DILocation(line: 72, column: 17, scope: !120)
!128 = !DILocation(line: 73, column: 21, scope: !120)
!129 = !DILocation(line: 73, column: 10, scope: !120)
!130 = !DILocation(line: 73, column: 19, scope: !120)
!131 = !DILocalVariable(name: "data", scope: !132, file: !14, line: 76, type: !4)
!132 = distinct !DILexicalBlock(scope: !106, file: !14, line: 75, column: 5)
!133 = !DILocation(line: 76, column: 16, scope: !132)
!134 = !DILocation(line: 76, column: 24, scope: !132)
!135 = !DILocation(line: 76, column: 23, scope: !132)
!136 = !DILocalVariable(name: "i", scope: !137, file: !14, line: 78, type: !49)
!137 = distinct !DILexicalBlock(scope: !132, file: !14, line: 77, column: 9)
!138 = !DILocation(line: 78, column: 20, scope: !137)
!139 = !DILocalVariable(name: "source", scope: !137, file: !14, line: 79, type: !54)
!140 = !DILocation(line: 79, column: 18, scope: !137)
!141 = !DILocation(line: 80, column: 13, scope: !137)
!142 = !DILocation(line: 81, column: 13, scope: !137)
!143 = !DILocation(line: 81, column: 27, scope: !137)
!144 = !DILocation(line: 83, column: 20, scope: !145)
!145 = distinct !DILexicalBlock(scope: !137, file: !14, line: 83, column: 13)
!146 = !DILocation(line: 83, column: 18, scope: !145)
!147 = !DILocation(line: 83, column: 25, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !14, line: 83, column: 13)
!149 = !DILocation(line: 83, column: 27, scope: !148)
!150 = !DILocation(line: 83, column: 13, scope: !145)
!151 = !DILocation(line: 85, column: 34, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !14, line: 84, column: 13)
!153 = !DILocation(line: 85, column: 27, scope: !152)
!154 = !DILocation(line: 85, column: 17, scope: !152)
!155 = !DILocation(line: 85, column: 22, scope: !152)
!156 = !DILocation(line: 85, column: 25, scope: !152)
!157 = !DILocation(line: 86, column: 13, scope: !152)
!158 = !DILocation(line: 83, column: 35, scope: !148)
!159 = !DILocation(line: 83, column: 13, scope: !148)
!160 = distinct !{!160, !150, !161, !79}
!161 = !DILocation(line: 86, column: 13, scope: !145)
!162 = !DILocation(line: 87, column: 13, scope: !137)
!163 = !DILocation(line: 87, column: 25, scope: !137)
!164 = !DILocation(line: 88, column: 23, scope: !137)
!165 = !DILocation(line: 88, column: 13, scope: !137)
!166 = !DILocation(line: 91, column: 1, scope: !106)
