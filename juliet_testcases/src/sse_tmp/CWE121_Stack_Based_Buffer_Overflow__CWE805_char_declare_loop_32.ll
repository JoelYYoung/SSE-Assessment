; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !34, metadata !DIExpression()), !dbg !36
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !37
  %1 = load i8*, i8** %0, align 8, !dbg !38
  store i8* %1, i8** %data1, align 8, !dbg !36
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i8* %arraydecay, i8** %data1, align 8, !dbg !40
  %2 = load i8*, i8** %data1, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !41
  store i8 0, i8* %arrayidx, align 1, !dbg !42
  %3 = load i8*, i8** %data1, align 8, !dbg !43
  %4 = load i8**, i8*** %dataPtr1, align 8, !dbg !44
  store i8* %3, i8** %4, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !46, metadata !DIExpression()), !dbg !48
  %5 = load i8**, i8*** %dataPtr2, align 8, !dbg !49
  %6 = load i8*, i8** %5, align 8, !dbg !50
  store i8* %6, i8** %data2, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !51, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !57, metadata !DIExpression()), !dbg !58
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !59
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 99, i1 false), !dbg !59
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !60
  store i8 0, i8* %arrayidx4, align 1, !dbg !61
  store i64 0, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !65
  %cmp = icmp ult i64 %7, 100, !dbg !67
  br i1 %cmp, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %8, !dbg !71
  %9 = load i8, i8* %arrayidx5, align 1, !dbg !71
  %10 = load i8*, i8** %data2, align 8, !dbg !72
  %11 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx6 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !72
  store i8 %9, i8* %arrayidx6, align 1, !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !76
  %inc = add i64 %12, 1, !dbg !76
  store i64 %inc, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  %13 = load i8*, i8** %data2, align 8, !dbg !81
  %arrayidx7 = getelementptr inbounds i8, i8* %13, i64 99, !dbg !81
  store i8 0, i8* %arrayidx7, align 1, !dbg !82
  %14 = load i8*, i8** %data2, align 8, !dbg !83
  call void @printLine(i8* %14), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_32_good() #0 !dbg !86 {
entry:
  call void @goodG2B(), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* null) #5, !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 %conv) #5, !dbg !99
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_32_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_32_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !110, metadata !DIExpression()), !dbg !111
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !112, metadata !DIExpression()), !dbg !113
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !118, metadata !DIExpression()), !dbg !120
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !121
  %1 = load i8*, i8** %0, align 8, !dbg !122
  store i8* %1, i8** %data1, align 8, !dbg !120
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !123
  store i8* %arraydecay, i8** %data1, align 8, !dbg !124
  %2 = load i8*, i8** %data1, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !125
  store i8 0, i8* %arrayidx, align 1, !dbg !126
  %3 = load i8*, i8** %data1, align 8, !dbg !127
  %4 = load i8**, i8*** %dataPtr1, align 8, !dbg !128
  store i8* %3, i8** %4, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !130, metadata !DIExpression()), !dbg !132
  %5 = load i8**, i8*** %dataPtr2, align 8, !dbg !133
  %6 = load i8*, i8** %5, align 8, !dbg !134
  store i8* %6, i8** %data2, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata i64* %i, metadata !135, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !140
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 99, i1 false), !dbg !140
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !141
  store i8 0, i8* %arrayidx4, align 1, !dbg !142
  store i64 0, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !146
  %cmp = icmp ult i64 %7, 100, !dbg !148
  br i1 %cmp, label %for.body, label %for.end, !dbg !149

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %8, !dbg !152
  %9 = load i8, i8* %arrayidx5, align 1, !dbg !152
  %10 = load i8*, i8** %data2, align 8, !dbg !153
  %11 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx6 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !153
  store i8 %9, i8* %arrayidx6, align 1, !dbg !155
  br label %for.inc, !dbg !156

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !157
  %inc = add i64 %12, 1, !dbg !157
  store i64 %inc, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !158, !llvm.loop !159

for.end:                                          ; preds = %for.cond
  %13 = load i8*, i8** %data2, align 8, !dbg !161
  %arrayidx7 = getelementptr inbounds i8, i8* %13, i64 99, !dbg !161
  store i8 0, i8* %arrayidx7, align 1, !dbg !162
  %14 = load i8*, i8** %data2, align 8, !dbg !163
  call void @printLine(i8* %14), !dbg !164
  ret void, !dbg !165
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_32.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 26, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!21 = !DILocation(line: 26, column: 13, scope: !11)
!22 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 27, type: !20)
!23 = !DILocation(line: 27, column: 13, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 28, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 28, column: 10, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 29, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 29, column: 10, scope: !11)
!34 = !DILocalVariable(name: "data", scope: !35, file: !12, line: 31, type: !16)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!36 = !DILocation(line: 31, column: 16, scope: !35)
!37 = !DILocation(line: 31, column: 24, scope: !35)
!38 = !DILocation(line: 31, column: 23, scope: !35)
!39 = !DILocation(line: 34, column: 16, scope: !35)
!40 = !DILocation(line: 34, column: 14, scope: !35)
!41 = !DILocation(line: 35, column: 9, scope: !35)
!42 = !DILocation(line: 35, column: 17, scope: !35)
!43 = !DILocation(line: 36, column: 21, scope: !35)
!44 = !DILocation(line: 36, column: 10, scope: !35)
!45 = !DILocation(line: 36, column: 19, scope: !35)
!46 = !DILocalVariable(name: "data", scope: !47, file: !12, line: 39, type: !16)
!47 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!48 = !DILocation(line: 39, column: 16, scope: !47)
!49 = !DILocation(line: 39, column: 24, scope: !47)
!50 = !DILocation(line: 39, column: 23, scope: !47)
!51 = !DILocalVariable(name: "i", scope: !52, file: !12, line: 41, type: !53)
!52 = distinct !DILexicalBlock(scope: !47, file: !12, line: 40, column: 9)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !54, line: 46, baseType: !55)
!54 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 41, column: 20, scope: !52)
!57 = !DILocalVariable(name: "source", scope: !52, file: !12, line: 42, type: !30)
!58 = !DILocation(line: 42, column: 18, scope: !52)
!59 = !DILocation(line: 43, column: 13, scope: !52)
!60 = !DILocation(line: 44, column: 13, scope: !52)
!61 = !DILocation(line: 44, column: 27, scope: !52)
!62 = !DILocation(line: 46, column: 20, scope: !63)
!63 = distinct !DILexicalBlock(scope: !52, file: !12, line: 46, column: 13)
!64 = !DILocation(line: 46, column: 18, scope: !63)
!65 = !DILocation(line: 46, column: 25, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !12, line: 46, column: 13)
!67 = !DILocation(line: 46, column: 27, scope: !66)
!68 = !DILocation(line: 46, column: 13, scope: !63)
!69 = !DILocation(line: 48, column: 34, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !12, line: 47, column: 13)
!71 = !DILocation(line: 48, column: 27, scope: !70)
!72 = !DILocation(line: 48, column: 17, scope: !70)
!73 = !DILocation(line: 48, column: 22, scope: !70)
!74 = !DILocation(line: 48, column: 25, scope: !70)
!75 = !DILocation(line: 49, column: 13, scope: !70)
!76 = !DILocation(line: 46, column: 35, scope: !66)
!77 = !DILocation(line: 46, column: 13, scope: !66)
!78 = distinct !{!78, !68, !79, !80}
!79 = !DILocation(line: 49, column: 13, scope: !63)
!80 = !{!"llvm.loop.mustprogress"}
!81 = !DILocation(line: 50, column: 13, scope: !52)
!82 = !DILocation(line: 50, column: 25, scope: !52)
!83 = !DILocation(line: 51, column: 23, scope: !52)
!84 = !DILocation(line: 51, column: 13, scope: !52)
!85 = !DILocation(line: 54, column: 1, scope: !11)
!86 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_32_good", scope: !12, file: !12, line: 93, type: !13, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocation(line: 95, column: 5, scope: !86)
!88 = !DILocation(line: 96, column: 1, scope: !86)
!89 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 107, type: !90, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{!92, !92, !20}
!92 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !12, line: 107, type: !92)
!94 = !DILocation(line: 107, column: 14, scope: !89)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !12, line: 107, type: !20)
!96 = !DILocation(line: 107, column: 27, scope: !89)
!97 = !DILocation(line: 110, column: 22, scope: !89)
!98 = !DILocation(line: 110, column: 12, scope: !89)
!99 = !DILocation(line: 110, column: 5, scope: !89)
!100 = !DILocation(line: 112, column: 5, scope: !89)
!101 = !DILocation(line: 113, column: 5, scope: !89)
!102 = !DILocation(line: 114, column: 5, scope: !89)
!103 = !DILocation(line: 117, column: 5, scope: !89)
!104 = !DILocation(line: 118, column: 5, scope: !89)
!105 = !DILocation(line: 119, column: 5, scope: !89)
!106 = !DILocation(line: 121, column: 5, scope: !89)
!107 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !12, line: 63, type: !16)
!109 = !DILocation(line: 63, column: 12, scope: !107)
!110 = !DILocalVariable(name: "dataPtr1", scope: !107, file: !12, line: 64, type: !20)
!111 = !DILocation(line: 64, column: 13, scope: !107)
!112 = !DILocalVariable(name: "dataPtr2", scope: !107, file: !12, line: 65, type: !20)
!113 = !DILocation(line: 65, column: 13, scope: !107)
!114 = !DILocalVariable(name: "dataBadBuffer", scope: !107, file: !12, line: 66, type: !25)
!115 = !DILocation(line: 66, column: 10, scope: !107)
!116 = !DILocalVariable(name: "dataGoodBuffer", scope: !107, file: !12, line: 67, type: !30)
!117 = !DILocation(line: 67, column: 10, scope: !107)
!118 = !DILocalVariable(name: "data", scope: !119, file: !12, line: 69, type: !16)
!119 = distinct !DILexicalBlock(scope: !107, file: !12, line: 68, column: 5)
!120 = !DILocation(line: 69, column: 16, scope: !119)
!121 = !DILocation(line: 69, column: 24, scope: !119)
!122 = !DILocation(line: 69, column: 23, scope: !119)
!123 = !DILocation(line: 71, column: 16, scope: !119)
!124 = !DILocation(line: 71, column: 14, scope: !119)
!125 = !DILocation(line: 72, column: 9, scope: !119)
!126 = !DILocation(line: 72, column: 17, scope: !119)
!127 = !DILocation(line: 73, column: 21, scope: !119)
!128 = !DILocation(line: 73, column: 10, scope: !119)
!129 = !DILocation(line: 73, column: 19, scope: !119)
!130 = !DILocalVariable(name: "data", scope: !131, file: !12, line: 76, type: !16)
!131 = distinct !DILexicalBlock(scope: !107, file: !12, line: 75, column: 5)
!132 = !DILocation(line: 76, column: 16, scope: !131)
!133 = !DILocation(line: 76, column: 24, scope: !131)
!134 = !DILocation(line: 76, column: 23, scope: !131)
!135 = !DILocalVariable(name: "i", scope: !136, file: !12, line: 78, type: !53)
!136 = distinct !DILexicalBlock(scope: !131, file: !12, line: 77, column: 9)
!137 = !DILocation(line: 78, column: 20, scope: !136)
!138 = !DILocalVariable(name: "source", scope: !136, file: !12, line: 79, type: !30)
!139 = !DILocation(line: 79, column: 18, scope: !136)
!140 = !DILocation(line: 80, column: 13, scope: !136)
!141 = !DILocation(line: 81, column: 13, scope: !136)
!142 = !DILocation(line: 81, column: 27, scope: !136)
!143 = !DILocation(line: 83, column: 20, scope: !144)
!144 = distinct !DILexicalBlock(scope: !136, file: !12, line: 83, column: 13)
!145 = !DILocation(line: 83, column: 18, scope: !144)
!146 = !DILocation(line: 83, column: 25, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !12, line: 83, column: 13)
!148 = !DILocation(line: 83, column: 27, scope: !147)
!149 = !DILocation(line: 83, column: 13, scope: !144)
!150 = !DILocation(line: 85, column: 34, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !12, line: 84, column: 13)
!152 = !DILocation(line: 85, column: 27, scope: !151)
!153 = !DILocation(line: 85, column: 17, scope: !151)
!154 = !DILocation(line: 85, column: 22, scope: !151)
!155 = !DILocation(line: 85, column: 25, scope: !151)
!156 = !DILocation(line: 86, column: 13, scope: !151)
!157 = !DILocation(line: 83, column: 35, scope: !147)
!158 = !DILocation(line: 83, column: 13, scope: !147)
!159 = distinct !{!159, !149, !160, !80}
!160 = !DILocation(line: 86, column: 13, scope: !144)
!161 = !DILocation(line: 87, column: 13, scope: !136)
!162 = !DILocation(line: 87, column: 25, scope: !136)
!163 = !DILocation(line: 88, column: 23, scope: !136)
!164 = !DILocation(line: 88, column: 13, scope: !136)
!165 = !DILocation(line: 91, column: 1, scope: !107)
