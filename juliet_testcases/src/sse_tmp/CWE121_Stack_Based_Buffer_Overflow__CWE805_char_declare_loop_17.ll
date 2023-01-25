; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i1 = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  store i32 0, i32* %i, align 4, !dbg !32
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !35
  %cmp = icmp slt i32 %0, 1, !dbg !37
  br i1 %cmp, label %for.body, label %for.end, !dbg !38

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i8* %arraydecay, i8** %data, align 8, !dbg !41
  %1 = load i8*, i8** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !42
  store i8 0, i8* %arrayidx, align 1, !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !45
  %inc = add nsw i32 %2, 1, !dbg !45
  store i32 %inc, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !50, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !56, metadata !DIExpression()), !dbg !57
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !58
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !58
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !59
  store i8 0, i8* %arrayidx3, align 1, !dbg !60
  store i64 0, i64* %i1, align 8, !dbg !61
  br label %for.cond4, !dbg !63

for.cond4:                                        ; preds = %for.inc9, %for.end
  %3 = load i64, i64* %i1, align 8, !dbg !64
  %cmp5 = icmp ult i64 %3, 100, !dbg !66
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !67

for.body6:                                        ; preds = %for.cond4
  %4 = load i64, i64* %i1, align 8, !dbg !68
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %4, !dbg !70
  %5 = load i8, i8* %arrayidx7, align 1, !dbg !70
  %6 = load i8*, i8** %data, align 8, !dbg !71
  %7 = load i64, i64* %i1, align 8, !dbg !72
  %arrayidx8 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !71
  store i8 %5, i8* %arrayidx8, align 1, !dbg !73
  br label %for.inc9, !dbg !74

for.inc9:                                         ; preds = %for.body6
  %8 = load i64, i64* %i1, align 8, !dbg !75
  %inc10 = add i64 %8, 1, !dbg !75
  store i64 %inc10, i64* %i1, align 8, !dbg !75
  br label %for.cond4, !dbg !76, !llvm.loop !77

for.end11:                                        ; preds = %for.cond4
  %9 = load i8*, i8** %data, align 8, !dbg !79
  %arrayidx12 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !79
  store i8 0, i8* %arrayidx12, align 1, !dbg !80
  %10 = load i8*, i8** %data, align 8, !dbg !81
  call void @printLine(i8* %10), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_17_good() #0 !dbg !84 {
entry:
  call void @goodG2B(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #5, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #5, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_17_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_17_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  store i32 0, i32* %h, align 4, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !117
  %cmp = icmp slt i32 %0, 1, !dbg !119
  br i1 %cmp, label %for.body, label %for.end, !dbg !120

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !121
  store i8* %arraydecay, i8** %data, align 8, !dbg !123
  %1 = load i8*, i8** %data, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !124
  store i8 0, i8* %arrayidx, align 1, !dbg !125
  br label %for.inc, !dbg !126

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %h, align 4, !dbg !127
  %inc = add nsw i32 %2, 1, !dbg !127
  store i32 %inc, i32* %h, align 4, !dbg !127
  br label %for.cond, !dbg !128, !llvm.loop !129

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !134, metadata !DIExpression()), !dbg !135
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !136
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !136
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !137
  store i8 0, i8* %arrayidx2, align 1, !dbg !138
  store i64 0, i64* %i, align 8, !dbg !139
  br label %for.cond3, !dbg !141

for.cond3:                                        ; preds = %for.inc8, %for.end
  %3 = load i64, i64* %i, align 8, !dbg !142
  %cmp4 = icmp ult i64 %3, 100, !dbg !144
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !145

for.body5:                                        ; preds = %for.cond3
  %4 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %4, !dbg !148
  %5 = load i8, i8* %arrayidx6, align 1, !dbg !148
  %6 = load i8*, i8** %data, align 8, !dbg !149
  %7 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx7 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !149
  store i8 %5, i8* %arrayidx7, align 1, !dbg !151
  br label %for.inc8, !dbg !152

for.inc8:                                         ; preds = %for.body5
  %8 = load i64, i64* %i, align 8, !dbg !153
  %inc9 = add i64 %8, 1, !dbg !153
  store i64 %inc9, i64* %i, align 8, !dbg !153
  br label %for.cond3, !dbg !154, !llvm.loop !155

for.end10:                                        ; preds = %for.cond3
  %9 = load i8*, i8** %data, align 8, !dbg !157
  %arrayidx11 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !157
  store i8 0, i8* %arrayidx11, align 1, !dbg !158
  %10 = load i8*, i8** %data, align 8, !dbg !159
  call void @printLine(i8* %10), !dbg !160
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_17_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 25, column: 9, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 26, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !DILocation(line: 26, column: 12, scope: !11)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 27, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 400, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 50)
!26 = !DILocation(line: 27, column: 10, scope: !11)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 28, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 800, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 28, column: 10, scope: !11)
!32 = !DILocation(line: 29, column: 11, scope: !33)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!34 = !DILocation(line: 29, column: 9, scope: !33)
!35 = !DILocation(line: 29, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !12, line: 29, column: 5)
!37 = !DILocation(line: 29, column: 18, scope: !36)
!38 = !DILocation(line: 29, column: 5, scope: !33)
!39 = !DILocation(line: 33, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !12, line: 30, column: 5)
!41 = !DILocation(line: 33, column: 14, scope: !40)
!42 = !DILocation(line: 34, column: 9, scope: !40)
!43 = !DILocation(line: 34, column: 17, scope: !40)
!44 = !DILocation(line: 35, column: 5, scope: !40)
!45 = !DILocation(line: 29, column: 24, scope: !36)
!46 = !DILocation(line: 29, column: 5, scope: !36)
!47 = distinct !{!47, !38, !48, !49}
!48 = !DILocation(line: 35, column: 5, scope: !33)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocalVariable(name: "i", scope: !51, file: !12, line: 37, type: !52)
!51 = distinct !DILexicalBlock(scope: !11, file: !12, line: 36, column: 5)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !53, line: 46, baseType: !54)
!53 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!54 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 37, column: 16, scope: !51)
!56 = !DILocalVariable(name: "source", scope: !51, file: !12, line: 38, type: !28)
!57 = !DILocation(line: 38, column: 14, scope: !51)
!58 = !DILocation(line: 39, column: 9, scope: !51)
!59 = !DILocation(line: 40, column: 9, scope: !51)
!60 = !DILocation(line: 40, column: 23, scope: !51)
!61 = !DILocation(line: 42, column: 16, scope: !62)
!62 = distinct !DILexicalBlock(scope: !51, file: !12, line: 42, column: 9)
!63 = !DILocation(line: 42, column: 14, scope: !62)
!64 = !DILocation(line: 42, column: 21, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !12, line: 42, column: 9)
!66 = !DILocation(line: 42, column: 23, scope: !65)
!67 = !DILocation(line: 42, column: 9, scope: !62)
!68 = !DILocation(line: 44, column: 30, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !12, line: 43, column: 9)
!70 = !DILocation(line: 44, column: 23, scope: !69)
!71 = !DILocation(line: 44, column: 13, scope: !69)
!72 = !DILocation(line: 44, column: 18, scope: !69)
!73 = !DILocation(line: 44, column: 21, scope: !69)
!74 = !DILocation(line: 45, column: 9, scope: !69)
!75 = !DILocation(line: 42, column: 31, scope: !65)
!76 = !DILocation(line: 42, column: 9, scope: !65)
!77 = distinct !{!77, !67, !78, !49}
!78 = !DILocation(line: 45, column: 9, scope: !62)
!79 = !DILocation(line: 46, column: 9, scope: !51)
!80 = !DILocation(line: 46, column: 21, scope: !51)
!81 = !DILocation(line: 47, column: 19, scope: !51)
!82 = !DILocation(line: 47, column: 9, scope: !51)
!83 = !DILocation(line: 49, column: 1, scope: !11)
!84 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_17_good", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 85, column: 5, scope: !84)
!86 = !DILocation(line: 86, column: 1, scope: !84)
!87 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 98, type: !88, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!16, !16, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !12, line: 98, type: !16)
!92 = !DILocation(line: 98, column: 14, scope: !87)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !12, line: 98, type: !90)
!94 = !DILocation(line: 98, column: 27, scope: !87)
!95 = !DILocation(line: 101, column: 22, scope: !87)
!96 = !DILocation(line: 101, column: 12, scope: !87)
!97 = !DILocation(line: 101, column: 5, scope: !87)
!98 = !DILocation(line: 103, column: 5, scope: !87)
!99 = !DILocation(line: 104, column: 5, scope: !87)
!100 = !DILocation(line: 105, column: 5, scope: !87)
!101 = !DILocation(line: 108, column: 5, scope: !87)
!102 = !DILocation(line: 109, column: 5, scope: !87)
!103 = !DILocation(line: 110, column: 5, scope: !87)
!104 = !DILocation(line: 112, column: 5, scope: !87)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "h", scope: !105, file: !12, line: 58, type: !16)
!107 = !DILocation(line: 58, column: 9, scope: !105)
!108 = !DILocalVariable(name: "data", scope: !105, file: !12, line: 59, type: !19)
!109 = !DILocation(line: 59, column: 12, scope: !105)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !12, line: 60, type: !23)
!111 = !DILocation(line: 60, column: 10, scope: !105)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !12, line: 61, type: !28)
!113 = !DILocation(line: 61, column: 10, scope: !105)
!114 = !DILocation(line: 62, column: 11, scope: !115)
!115 = distinct !DILexicalBlock(scope: !105, file: !12, line: 62, column: 5)
!116 = !DILocation(line: 62, column: 9, scope: !115)
!117 = !DILocation(line: 62, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !12, line: 62, column: 5)
!119 = !DILocation(line: 62, column: 18, scope: !118)
!120 = !DILocation(line: 62, column: 5, scope: !115)
!121 = !DILocation(line: 65, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !12, line: 63, column: 5)
!123 = !DILocation(line: 65, column: 14, scope: !122)
!124 = !DILocation(line: 66, column: 9, scope: !122)
!125 = !DILocation(line: 66, column: 17, scope: !122)
!126 = !DILocation(line: 67, column: 5, scope: !122)
!127 = !DILocation(line: 62, column: 24, scope: !118)
!128 = !DILocation(line: 62, column: 5, scope: !118)
!129 = distinct !{!129, !120, !130, !49}
!130 = !DILocation(line: 67, column: 5, scope: !115)
!131 = !DILocalVariable(name: "i", scope: !132, file: !12, line: 69, type: !52)
!132 = distinct !DILexicalBlock(scope: !105, file: !12, line: 68, column: 5)
!133 = !DILocation(line: 69, column: 16, scope: !132)
!134 = !DILocalVariable(name: "source", scope: !132, file: !12, line: 70, type: !28)
!135 = !DILocation(line: 70, column: 14, scope: !132)
!136 = !DILocation(line: 71, column: 9, scope: !132)
!137 = !DILocation(line: 72, column: 9, scope: !132)
!138 = !DILocation(line: 72, column: 23, scope: !132)
!139 = !DILocation(line: 74, column: 16, scope: !140)
!140 = distinct !DILexicalBlock(scope: !132, file: !12, line: 74, column: 9)
!141 = !DILocation(line: 74, column: 14, scope: !140)
!142 = !DILocation(line: 74, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !12, line: 74, column: 9)
!144 = !DILocation(line: 74, column: 23, scope: !143)
!145 = !DILocation(line: 74, column: 9, scope: !140)
!146 = !DILocation(line: 76, column: 30, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !12, line: 75, column: 9)
!148 = !DILocation(line: 76, column: 23, scope: !147)
!149 = !DILocation(line: 76, column: 13, scope: !147)
!150 = !DILocation(line: 76, column: 18, scope: !147)
!151 = !DILocation(line: 76, column: 21, scope: !147)
!152 = !DILocation(line: 77, column: 9, scope: !147)
!153 = !DILocation(line: 74, column: 31, scope: !143)
!154 = !DILocation(line: 74, column: 9, scope: !143)
!155 = distinct !{!155, !145, !156, !49}
!156 = !DILocation(line: 77, column: 9, scope: !140)
!157 = !DILocation(line: 78, column: 9, scope: !132)
!158 = !DILocation(line: 78, column: 21, scope: !132)
!159 = !DILocation(line: 79, column: 19, scope: !132)
!160 = !DILocation(line: 79, column: 9, scope: !132)
!161 = !DILocation(line: 81, column: 1, scope: !105)
