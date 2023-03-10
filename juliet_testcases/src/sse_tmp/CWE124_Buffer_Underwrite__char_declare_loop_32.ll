; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_32.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_loop_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %data3 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !32, metadata !DIExpression()), !dbg !34
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !35
  %1 = load i8*, i8** %0, align 8, !dbg !36
  store i8* %1, i8** %data1, align 8, !dbg !34
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !37
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay2, i64 -8, !dbg !38
  store i8* %add.ptr, i8** %data1, align 8, !dbg !39
  %2 = load i8*, i8** %data1, align 8, !dbg !40
  %3 = load i8**, i8*** %dataPtr1, align 8, !dbg !41
  store i8* %2, i8** %3, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !43, metadata !DIExpression()), !dbg !45
  %4 = load i8**, i8*** %dataPtr2, align 8, !dbg !46
  %5 = load i8*, i8** %4, align 8, !dbg !47
  store i8* %5, i8** %data3, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !54, metadata !DIExpression()), !dbg !55
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !56
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !57
  store i8 0, i8* %arrayidx5, align 1, !dbg !58
  store i64 0, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !62
  %cmp = icmp ult i64 %6, 100, !dbg !64
  br i1 %cmp, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %7, !dbg !68
  %8 = load i8, i8* %arrayidx6, align 1, !dbg !68
  %9 = load i8*, i8** %data3, align 8, !dbg !69
  %10 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx7 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !69
  store i8 %8, i8* %arrayidx7, align 1, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %11, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data3, align 8, !dbg !78
  %arrayidx8 = getelementptr inbounds i8, i8* %12, i64 99, !dbg !78
  store i8 0, i8* %arrayidx8, align 1, !dbg !79
  %13 = load i8*, i8** %data3, align 8, !dbg !80
  call void @printLine(i8* %13), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_loop_32_good() #0 !dbg !83 {
entry:
  call void @goodG2B(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* null) #5, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #5, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE124_Buffer_Underwrite__char_declare_loop_32_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE124_Buffer_Underwrite__char_declare_loop_32_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %data3 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !107, metadata !DIExpression()), !dbg !108
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !109, metadata !DIExpression()), !dbg !110
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !113
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !116, metadata !DIExpression()), !dbg !118
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !119
  %1 = load i8*, i8** %0, align 8, !dbg !120
  store i8* %1, i8** %data1, align 8, !dbg !118
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !121
  store i8* %arraydecay2, i8** %data1, align 8, !dbg !122
  %2 = load i8*, i8** %data1, align 8, !dbg !123
  %3 = load i8**, i8*** %dataPtr1, align 8, !dbg !124
  store i8* %2, i8** %3, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !126, metadata !DIExpression()), !dbg !128
  %4 = load i8**, i8*** %dataPtr2, align 8, !dbg !129
  %5 = load i8*, i8** %4, align 8, !dbg !130
  store i8* %5, i8** %data3, align 8, !dbg !128
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !134, metadata !DIExpression()), !dbg !135
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !136
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !136
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !137
  store i8 0, i8* %arrayidx5, align 1, !dbg !138
  store i64 0, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !141

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !142
  %cmp = icmp ult i64 %6, 100, !dbg !144
  br i1 %cmp, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %7, !dbg !148
  %8 = load i8, i8* %arrayidx6, align 1, !dbg !148
  %9 = load i8*, i8** %data3, align 8, !dbg !149
  %10 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx7 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !149
  store i8 %8, i8* %arrayidx7, align 1, !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !153
  %inc = add i64 %11, 1, !dbg !153
  store i64 %inc, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data3, align 8, !dbg !157
  %arrayidx8 = getelementptr inbounds i8, i8* %12, i64 99, !dbg !157
  store i8 0, i8* %arrayidx8, align 1, !dbg !158
  %13 = load i8*, i8** %data3, align 8, !dbg !159
  call void @printLine(i8* %13), !dbg !160
  ret void, !dbg !161
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_loop_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!24 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 28, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 28, column: 10, scope: !11)
!29 = !DILocation(line: 29, column: 5, scope: !11)
!30 = !DILocation(line: 30, column: 5, scope: !11)
!31 = !DILocation(line: 30, column: 23, scope: !11)
!32 = !DILocalVariable(name: "data", scope: !33, file: !12, line: 32, type: !16)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!34 = !DILocation(line: 32, column: 16, scope: !33)
!35 = !DILocation(line: 32, column: 24, scope: !33)
!36 = !DILocation(line: 32, column: 23, scope: !33)
!37 = !DILocation(line: 34, column: 16, scope: !33)
!38 = !DILocation(line: 34, column: 27, scope: !33)
!39 = !DILocation(line: 34, column: 14, scope: !33)
!40 = !DILocation(line: 35, column: 21, scope: !33)
!41 = !DILocation(line: 35, column: 10, scope: !33)
!42 = !DILocation(line: 35, column: 19, scope: !33)
!43 = !DILocalVariable(name: "data", scope: !44, file: !12, line: 38, type: !16)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!45 = !DILocation(line: 38, column: 16, scope: !44)
!46 = !DILocation(line: 38, column: 24, scope: !44)
!47 = !DILocation(line: 38, column: 23, scope: !44)
!48 = !DILocalVariable(name: "i", scope: !49, file: !12, line: 40, type: !50)
!49 = distinct !DILexicalBlock(scope: !44, file: !12, line: 39, column: 9)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !51, line: 46, baseType: !52)
!51 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!52 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 40, column: 20, scope: !49)
!54 = !DILocalVariable(name: "source", scope: !49, file: !12, line: 41, type: !25)
!55 = !DILocation(line: 41, column: 18, scope: !49)
!56 = !DILocation(line: 42, column: 13, scope: !49)
!57 = !DILocation(line: 43, column: 13, scope: !49)
!58 = !DILocation(line: 43, column: 27, scope: !49)
!59 = !DILocation(line: 45, column: 20, scope: !60)
!60 = distinct !DILexicalBlock(scope: !49, file: !12, line: 45, column: 13)
!61 = !DILocation(line: 45, column: 18, scope: !60)
!62 = !DILocation(line: 45, column: 25, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !12, line: 45, column: 13)
!64 = !DILocation(line: 45, column: 27, scope: !63)
!65 = !DILocation(line: 45, column: 13, scope: !60)
!66 = !DILocation(line: 47, column: 34, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !12, line: 46, column: 13)
!68 = !DILocation(line: 47, column: 27, scope: !67)
!69 = !DILocation(line: 47, column: 17, scope: !67)
!70 = !DILocation(line: 47, column: 22, scope: !67)
!71 = !DILocation(line: 47, column: 25, scope: !67)
!72 = !DILocation(line: 48, column: 13, scope: !67)
!73 = !DILocation(line: 45, column: 35, scope: !63)
!74 = !DILocation(line: 45, column: 13, scope: !63)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 48, column: 13, scope: !60)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 50, column: 13, scope: !49)
!79 = !DILocation(line: 50, column: 25, scope: !49)
!80 = !DILocation(line: 51, column: 23, scope: !49)
!81 = !DILocation(line: 51, column: 13, scope: !49)
!82 = !DILocation(line: 54, column: 1, scope: !11)
!83 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_loop_32_good", scope: !12, file: !12, line: 94, type: !13, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 96, column: 5, scope: !83)
!85 = !DILocation(line: 97, column: 1, scope: !83)
!86 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 108, type: !87, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!89, !89, !20}
!89 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !12, line: 108, type: !89)
!91 = !DILocation(line: 108, column: 14, scope: !86)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !12, line: 108, type: !20)
!93 = !DILocation(line: 108, column: 27, scope: !86)
!94 = !DILocation(line: 111, column: 22, scope: !86)
!95 = !DILocation(line: 111, column: 12, scope: !86)
!96 = !DILocation(line: 111, column: 5, scope: !86)
!97 = !DILocation(line: 113, column: 5, scope: !86)
!98 = !DILocation(line: 114, column: 5, scope: !86)
!99 = !DILocation(line: 115, column: 5, scope: !86)
!100 = !DILocation(line: 118, column: 5, scope: !86)
!101 = !DILocation(line: 119, column: 5, scope: !86)
!102 = !DILocation(line: 120, column: 5, scope: !86)
!103 = !DILocation(line: 122, column: 5, scope: !86)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 63, type: !16)
!106 = !DILocation(line: 63, column: 12, scope: !104)
!107 = !DILocalVariable(name: "dataPtr1", scope: !104, file: !12, line: 64, type: !20)
!108 = !DILocation(line: 64, column: 13, scope: !104)
!109 = !DILocalVariable(name: "dataPtr2", scope: !104, file: !12, line: 65, type: !20)
!110 = !DILocation(line: 65, column: 13, scope: !104)
!111 = !DILocalVariable(name: "dataBuffer", scope: !104, file: !12, line: 66, type: !25)
!112 = !DILocation(line: 66, column: 10, scope: !104)
!113 = !DILocation(line: 67, column: 5, scope: !104)
!114 = !DILocation(line: 68, column: 5, scope: !104)
!115 = !DILocation(line: 68, column: 23, scope: !104)
!116 = !DILocalVariable(name: "data", scope: !117, file: !12, line: 70, type: !16)
!117 = distinct !DILexicalBlock(scope: !104, file: !12, line: 69, column: 5)
!118 = !DILocation(line: 70, column: 16, scope: !117)
!119 = !DILocation(line: 70, column: 24, scope: !117)
!120 = !DILocation(line: 70, column: 23, scope: !117)
!121 = !DILocation(line: 72, column: 16, scope: !117)
!122 = !DILocation(line: 72, column: 14, scope: !117)
!123 = !DILocation(line: 73, column: 21, scope: !117)
!124 = !DILocation(line: 73, column: 10, scope: !117)
!125 = !DILocation(line: 73, column: 19, scope: !117)
!126 = !DILocalVariable(name: "data", scope: !127, file: !12, line: 76, type: !16)
!127 = distinct !DILexicalBlock(scope: !104, file: !12, line: 75, column: 5)
!128 = !DILocation(line: 76, column: 16, scope: !127)
!129 = !DILocation(line: 76, column: 24, scope: !127)
!130 = !DILocation(line: 76, column: 23, scope: !127)
!131 = !DILocalVariable(name: "i", scope: !132, file: !12, line: 78, type: !50)
!132 = distinct !DILexicalBlock(scope: !127, file: !12, line: 77, column: 9)
!133 = !DILocation(line: 78, column: 20, scope: !132)
!134 = !DILocalVariable(name: "source", scope: !132, file: !12, line: 79, type: !25)
!135 = !DILocation(line: 79, column: 18, scope: !132)
!136 = !DILocation(line: 80, column: 13, scope: !132)
!137 = !DILocation(line: 81, column: 13, scope: !132)
!138 = !DILocation(line: 81, column: 27, scope: !132)
!139 = !DILocation(line: 83, column: 20, scope: !140)
!140 = distinct !DILexicalBlock(scope: !132, file: !12, line: 83, column: 13)
!141 = !DILocation(line: 83, column: 18, scope: !140)
!142 = !DILocation(line: 83, column: 25, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !12, line: 83, column: 13)
!144 = !DILocation(line: 83, column: 27, scope: !143)
!145 = !DILocation(line: 83, column: 13, scope: !140)
!146 = !DILocation(line: 85, column: 34, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !12, line: 84, column: 13)
!148 = !DILocation(line: 85, column: 27, scope: !147)
!149 = !DILocation(line: 85, column: 17, scope: !147)
!150 = !DILocation(line: 85, column: 22, scope: !147)
!151 = !DILocation(line: 85, column: 25, scope: !147)
!152 = !DILocation(line: 86, column: 13, scope: !147)
!153 = !DILocation(line: 83, column: 35, scope: !143)
!154 = !DILocation(line: 83, column: 13, scope: !143)
!155 = distinct !{!155, !145, !156, !77}
!156 = !DILocation(line: 86, column: 13, scope: !140)
!157 = !DILocation(line: 88, column: 13, scope: !132)
!158 = !DILocation(line: 88, column: 25, scope: !132)
!159 = !DILocation(line: 89, column: 23, scope: !132)
!160 = !DILocation(line: 89, column: 13, scope: !132)
!161 = !DILocation(line: 92, column: 1, scope: !104)
