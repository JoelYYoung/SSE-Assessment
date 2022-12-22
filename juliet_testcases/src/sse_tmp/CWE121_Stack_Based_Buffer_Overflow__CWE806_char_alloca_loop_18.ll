; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_18.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_18_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  store i8* %1, i8** %data, align 8, !dbg !23
  br label %source, !dbg !24

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !25), !dbg !26
  %2 = load i8*, i8** %data, align 8, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !28
  %3 = load i8*, i8** %data, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !31, metadata !DIExpression()), !dbg !36
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !42, metadata !DIExpression()), !dbg !43
  %5 = load i8*, i8** %data, align 8, !dbg !44
  %call = call i64 @strlen(i8* %5) #6, !dbg !45
  store i64 %call, i64* %dataLen, align 8, !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %source
  %6 = load i64, i64* %i, align 8, !dbg !50
  %7 = load i64, i64* %dataLen, align 8, !dbg !52
  %cmp = icmp ult i64 %6, %7, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !55
  %9 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx1 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !55
  %10 = load i8, i8* %arrayidx1, align 1, !dbg !55
  %11 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !59
  store i8 %10, i8* %arrayidx2, align 1, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %12, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !67
  store i8 0, i8* %arrayidx3, align 1, !dbg !68
  %13 = load i8*, i8** %data, align 8, !dbg !69
  call void @printLine(i8* %13), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_18_good() #0 !dbg !72 {
entry:
  call void @goodG2B(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #7, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #7, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_18_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_18_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !94 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = alloca i8, i64 100, align 16, !dbg !99
  store i8* %0, i8** %dataBuffer, align 8, !dbg !98
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !100
  store i8* %1, i8** %data, align 8, !dbg !101
  br label %source, !dbg !102

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !103), !dbg !104
  %2 = load i8*, i8** %data, align 8, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !106
  %3 = load i8*, i8** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !109, metadata !DIExpression()), !dbg !111
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !111
  call void @llvm.dbg.declare(metadata i64* %i, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !114, metadata !DIExpression()), !dbg !115
  %5 = load i8*, i8** %data, align 8, !dbg !116
  %call = call i64 @strlen(i8* %5) #6, !dbg !117
  store i64 %call, i64* %dataLen, align 8, !dbg !118
  store i64 0, i64* %i, align 8, !dbg !119
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %source
  %6 = load i64, i64* %i, align 8, !dbg !122
  %7 = load i64, i64* %dataLen, align 8, !dbg !124
  %cmp = icmp ult i64 %6, %7, !dbg !125
  br i1 %cmp, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !127
  %9 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx1 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !127
  %10 = load i8, i8* %arrayidx1, align 1, !dbg !127
  %11 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !131
  store i8 %10, i8* %arrayidx2, align 1, !dbg !132
  br label %for.inc, !dbg !133

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !134
  %inc = add i64 %12, 1, !dbg !134
  store i64 %inc, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !135, !llvm.loop !136

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !138
  store i8 0, i8* %arrayidx3, align 1, !dbg !139
  %13 = load i8*, i8** %data, align 8, !dbg !140
  call void @printLine(i8* %13), !dbg !141
  ret void, !dbg !142
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_18.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_18_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_18.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 10, scope: !13)
!24 = !DILocation(line: 28, column: 5, scope: !13)
!25 = !DILabel(scope: !13, name: "source", file: !14, line: 29)
!26 = !DILocation(line: 29, column: 1, scope: !13)
!27 = !DILocation(line: 31, column: 12, scope: !13)
!28 = !DILocation(line: 31, column: 5, scope: !13)
!29 = !DILocation(line: 32, column: 5, scope: !13)
!30 = !DILocation(line: 32, column: 17, scope: !13)
!31 = !DILocalVariable(name: "dest", scope: !32, file: !14, line: 34, type: !33)
!32 = distinct !DILexicalBlock(scope: !13, file: !14, line: 33, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 50)
!36 = !DILocation(line: 34, column: 14, scope: !32)
!37 = !DILocalVariable(name: "i", scope: !32, file: !14, line: 35, type: !38)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 35, column: 16, scope: !32)
!42 = !DILocalVariable(name: "dataLen", scope: !32, file: !14, line: 35, type: !38)
!43 = !DILocation(line: 35, column: 19, scope: !32)
!44 = !DILocation(line: 36, column: 26, scope: !32)
!45 = !DILocation(line: 36, column: 19, scope: !32)
!46 = !DILocation(line: 36, column: 17, scope: !32)
!47 = !DILocation(line: 38, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !32, file: !14, line: 38, column: 9)
!49 = !DILocation(line: 38, column: 14, scope: !48)
!50 = !DILocation(line: 38, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !14, line: 38, column: 9)
!52 = !DILocation(line: 38, column: 25, scope: !51)
!53 = !DILocation(line: 38, column: 23, scope: !51)
!54 = !DILocation(line: 38, column: 9, scope: !48)
!55 = !DILocation(line: 40, column: 23, scope: !56)
!56 = distinct !DILexicalBlock(scope: !51, file: !14, line: 39, column: 9)
!57 = !DILocation(line: 40, column: 28, scope: !56)
!58 = !DILocation(line: 40, column: 18, scope: !56)
!59 = !DILocation(line: 40, column: 13, scope: !56)
!60 = !DILocation(line: 40, column: 21, scope: !56)
!61 = !DILocation(line: 41, column: 9, scope: !56)
!62 = !DILocation(line: 38, column: 35, scope: !51)
!63 = !DILocation(line: 38, column: 9, scope: !51)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 41, column: 9, scope: !48)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 42, column: 9, scope: !32)
!68 = !DILocation(line: 42, column: 20, scope: !32)
!69 = !DILocation(line: 43, column: 19, scope: !32)
!70 = !DILocation(line: 43, column: 9, scope: !32)
!71 = !DILocation(line: 45, column: 1, scope: !13)
!72 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_18_good", scope: !14, file: !14, line: 76, type: !15, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 78, column: 5, scope: !72)
!74 = !DILocation(line: 79, column: 1, scope: !72)
!75 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 91, type: !76, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!78, !78, !79}
!78 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !14, line: 91, type: !78)
!81 = !DILocation(line: 91, column: 14, scope: !75)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !14, line: 91, type: !79)
!83 = !DILocation(line: 91, column: 27, scope: !75)
!84 = !DILocation(line: 94, column: 22, scope: !75)
!85 = !DILocation(line: 94, column: 12, scope: !75)
!86 = !DILocation(line: 94, column: 5, scope: !75)
!87 = !DILocation(line: 96, column: 5, scope: !75)
!88 = !DILocation(line: 97, column: 5, scope: !75)
!89 = !DILocation(line: 98, column: 5, scope: !75)
!90 = !DILocation(line: 101, column: 5, scope: !75)
!91 = !DILocation(line: 102, column: 5, scope: !75)
!92 = !DILocation(line: 103, column: 5, scope: !75)
!93 = !DILocation(line: 105, column: 5, scope: !75)
!94 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 52, type: !15, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !14, line: 54, type: !4)
!96 = !DILocation(line: 54, column: 12, scope: !94)
!97 = !DILocalVariable(name: "dataBuffer", scope: !94, file: !14, line: 55, type: !4)
!98 = !DILocation(line: 55, column: 12, scope: !94)
!99 = !DILocation(line: 55, column: 33, scope: !94)
!100 = !DILocation(line: 56, column: 12, scope: !94)
!101 = !DILocation(line: 56, column: 10, scope: !94)
!102 = !DILocation(line: 57, column: 5, scope: !94)
!103 = !DILabel(scope: !94, name: "source", file: !14, line: 58)
!104 = !DILocation(line: 58, column: 1, scope: !94)
!105 = !DILocation(line: 60, column: 12, scope: !94)
!106 = !DILocation(line: 60, column: 5, scope: !94)
!107 = !DILocation(line: 61, column: 5, scope: !94)
!108 = !DILocation(line: 61, column: 16, scope: !94)
!109 = !DILocalVariable(name: "dest", scope: !110, file: !14, line: 63, type: !33)
!110 = distinct !DILexicalBlock(scope: !94, file: !14, line: 62, column: 5)
!111 = !DILocation(line: 63, column: 14, scope: !110)
!112 = !DILocalVariable(name: "i", scope: !110, file: !14, line: 64, type: !38)
!113 = !DILocation(line: 64, column: 16, scope: !110)
!114 = !DILocalVariable(name: "dataLen", scope: !110, file: !14, line: 64, type: !38)
!115 = !DILocation(line: 64, column: 19, scope: !110)
!116 = !DILocation(line: 65, column: 26, scope: !110)
!117 = !DILocation(line: 65, column: 19, scope: !110)
!118 = !DILocation(line: 65, column: 17, scope: !110)
!119 = !DILocation(line: 67, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !110, file: !14, line: 67, column: 9)
!121 = !DILocation(line: 67, column: 14, scope: !120)
!122 = !DILocation(line: 67, column: 21, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !14, line: 67, column: 9)
!124 = !DILocation(line: 67, column: 25, scope: !123)
!125 = !DILocation(line: 67, column: 23, scope: !123)
!126 = !DILocation(line: 67, column: 9, scope: !120)
!127 = !DILocation(line: 69, column: 23, scope: !128)
!128 = distinct !DILexicalBlock(scope: !123, file: !14, line: 68, column: 9)
!129 = !DILocation(line: 69, column: 28, scope: !128)
!130 = !DILocation(line: 69, column: 18, scope: !128)
!131 = !DILocation(line: 69, column: 13, scope: !128)
!132 = !DILocation(line: 69, column: 21, scope: !128)
!133 = !DILocation(line: 70, column: 9, scope: !128)
!134 = !DILocation(line: 67, column: 35, scope: !123)
!135 = !DILocation(line: 67, column: 9, scope: !123)
!136 = distinct !{!136, !126, !137, !66}
!137 = !DILocation(line: 70, column: 9, scope: !120)
!138 = !DILocation(line: 71, column: 9, scope: !110)
!139 = !DILocation(line: 71, column: 20, scope: !110)
!140 = !DILocation(line: 72, column: 19, scope: !110)
!141 = !DILocation(line: 72, column: 9, scope: !110)
!142 = !DILocation(line: 74, column: 1, scope: !94)
