; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_02.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_02_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  store i8* %arraydecay, i8** %data, align 8, !dbg !32
  %0 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !41, metadata !DIExpression()), !dbg !42
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !43
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !44
  store i8 0, i8* %arrayidx2, align 1, !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !49
  %cmp = icmp ult i64 %1, 100, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !55
  %3 = load i8, i8* %arrayidx3, align 1, !dbg !55
  %4 = load i8*, i8** %data, align 8, !dbg !56
  %5 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !56
  store i8 %3, i8* %arrayidx4, align 1, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %6, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !65
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !65
  store i8 0, i8* %arrayidx5, align 1, !dbg !66
  %8 = load i8*, i8** %data, align 8, !dbg !67
  call void @printLine(i8* %8), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_02_good() #0 !dbg !70 {
entry:
  call void @goodG2B1(), !dbg !71
  call void @goodG2B2(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_02_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_02_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !93 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !100
  store i8* %arraydecay, i8** %data, align 8, !dbg !103
  %0 = load i8*, i8** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !104
  store i8 0, i8* %arrayidx, align 1, !dbg !105
  call void @llvm.dbg.declare(metadata i64* %i, metadata !106, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !109, metadata !DIExpression()), !dbg !110
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !111
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !112
  store i8 0, i8* %arrayidx2, align 1, !dbg !113
  store i64 0, i64* %i, align 8, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !117
  %cmp = icmp ult i64 %1, 100, !dbg !119
  br i1 %cmp, label %for.body, label %for.end, !dbg !120

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !123
  %3 = load i8, i8* %arrayidx3, align 1, !dbg !123
  %4 = load i8*, i8** %data, align 8, !dbg !124
  %5 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !124
  store i8 %3, i8* %arrayidx4, align 1, !dbg !126
  br label %for.inc, !dbg !127

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !128
  %inc = add i64 %6, 1, !dbg !128
  store i64 %inc, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !129, !llvm.loop !130

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !132
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !132
  store i8 0, i8* %arrayidx5, align 1, !dbg !133
  %8 = load i8*, i8** %data, align 8, !dbg !134
  call void @printLine(i8* %8), !dbg !135
  ret void, !dbg !136
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !137 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !142, metadata !DIExpression()), !dbg !143
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !144
  store i8* %arraydecay, i8** %data, align 8, !dbg !147
  %0 = load i8*, i8** %data, align 8, !dbg !148
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !148
  store i8 0, i8* %arrayidx, align 1, !dbg !149
  call void @llvm.dbg.declare(metadata i64* %i, metadata !150, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !153, metadata !DIExpression()), !dbg !154
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !155
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !155
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !156
  store i8 0, i8* %arrayidx2, align 1, !dbg !157
  store i64 0, i64* %i, align 8, !dbg !158
  br label %for.cond, !dbg !160

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !161
  %cmp = icmp ult i64 %1, 100, !dbg !163
  br i1 %cmp, label %for.body, label %for.end, !dbg !164

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !165
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !167
  %3 = load i8, i8* %arrayidx3, align 1, !dbg !167
  %4 = load i8*, i8** %data, align 8, !dbg !168
  %5 = load i64, i64* %i, align 8, !dbg !169
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !168
  store i8 %3, i8* %arrayidx4, align 1, !dbg !170
  br label %for.inc, !dbg !171

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !172
  %inc = add i64 %6, 1, !dbg !172
  store i64 %inc, i64* %i, align 8, !dbg !172
  br label %for.cond, !dbg !173, !llvm.loop !174

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !176
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !176
  store i8 0, i8* %arrayidx5, align 1, !dbg !177
  %8 = load i8*, i8** %data, align 8, !dbg !178
  call void @printLine(i8* %8), !dbg !179
  ret void, !dbg !180
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_02.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_02_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_02.c", directory: "/root/SSE-Assessment")
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
!29 = !DILocation(line: 32, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !12, line: 29, column: 5)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!32 = !DILocation(line: 32, column: 14, scope: !30)
!33 = !DILocation(line: 33, column: 9, scope: !30)
!34 = !DILocation(line: 33, column: 17, scope: !30)
!35 = !DILocalVariable(name: "i", scope: !36, file: !12, line: 36, type: !37)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 36, column: 16, scope: !36)
!41 = !DILocalVariable(name: "source", scope: !36, file: !12, line: 37, type: !25)
!42 = !DILocation(line: 37, column: 14, scope: !36)
!43 = !DILocation(line: 38, column: 9, scope: !36)
!44 = !DILocation(line: 39, column: 9, scope: !36)
!45 = !DILocation(line: 39, column: 23, scope: !36)
!46 = !DILocation(line: 41, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !36, file: !12, line: 41, column: 9)
!48 = !DILocation(line: 41, column: 14, scope: !47)
!49 = !DILocation(line: 41, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !12, line: 41, column: 9)
!51 = !DILocation(line: 41, column: 23, scope: !50)
!52 = !DILocation(line: 41, column: 9, scope: !47)
!53 = !DILocation(line: 43, column: 30, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !12, line: 42, column: 9)
!55 = !DILocation(line: 43, column: 23, scope: !54)
!56 = !DILocation(line: 43, column: 13, scope: !54)
!57 = !DILocation(line: 43, column: 18, scope: !54)
!58 = !DILocation(line: 43, column: 21, scope: !54)
!59 = !DILocation(line: 44, column: 9, scope: !54)
!60 = !DILocation(line: 41, column: 31, scope: !50)
!61 = !DILocation(line: 41, column: 9, scope: !50)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 44, column: 9, scope: !47)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 45, column: 9, scope: !36)
!66 = !DILocation(line: 45, column: 21, scope: !36)
!67 = !DILocation(line: 46, column: 19, scope: !36)
!68 = !DILocation(line: 46, column: 9, scope: !36)
!69 = !DILocation(line: 48, column: 1, scope: !11)
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_02_good", scope: !12, file: !12, line: 113, type: !13, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 115, column: 5, scope: !70)
!72 = !DILocation(line: 116, column: 5, scope: !70)
!73 = !DILocation(line: 117, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 129, type: !75, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!77, !77, !78}
!77 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !12, line: 129, type: !77)
!80 = !DILocation(line: 129, column: 14, scope: !74)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !12, line: 129, type: !78)
!82 = !DILocation(line: 129, column: 27, scope: !74)
!83 = !DILocation(line: 132, column: 22, scope: !74)
!84 = !DILocation(line: 132, column: 12, scope: !74)
!85 = !DILocation(line: 132, column: 5, scope: !74)
!86 = !DILocation(line: 134, column: 5, scope: !74)
!87 = !DILocation(line: 135, column: 5, scope: !74)
!88 = !DILocation(line: 136, column: 5, scope: !74)
!89 = !DILocation(line: 139, column: 5, scope: !74)
!90 = !DILocation(line: 140, column: 5, scope: !74)
!91 = !DILocation(line: 141, column: 5, scope: !74)
!92 = !DILocation(line: 143, column: 5, scope: !74)
!93 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !12, line: 57, type: !16)
!95 = !DILocation(line: 57, column: 12, scope: !93)
!96 = !DILocalVariable(name: "dataBadBuffer", scope: !93, file: !12, line: 58, type: !20)
!97 = !DILocation(line: 58, column: 10, scope: !93)
!98 = !DILocalVariable(name: "dataGoodBuffer", scope: !93, file: !12, line: 59, type: !25)
!99 = !DILocation(line: 59, column: 10, scope: !93)
!100 = !DILocation(line: 68, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !102, file: !12, line: 66, column: 5)
!102 = distinct !DILexicalBlock(scope: !93, file: !12, line: 60, column: 8)
!103 = !DILocation(line: 68, column: 14, scope: !101)
!104 = !DILocation(line: 69, column: 9, scope: !101)
!105 = !DILocation(line: 69, column: 17, scope: !101)
!106 = !DILocalVariable(name: "i", scope: !107, file: !12, line: 72, type: !37)
!107 = distinct !DILexicalBlock(scope: !93, file: !12, line: 71, column: 5)
!108 = !DILocation(line: 72, column: 16, scope: !107)
!109 = !DILocalVariable(name: "source", scope: !107, file: !12, line: 73, type: !25)
!110 = !DILocation(line: 73, column: 14, scope: !107)
!111 = !DILocation(line: 74, column: 9, scope: !107)
!112 = !DILocation(line: 75, column: 9, scope: !107)
!113 = !DILocation(line: 75, column: 23, scope: !107)
!114 = !DILocation(line: 77, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !107, file: !12, line: 77, column: 9)
!116 = !DILocation(line: 77, column: 14, scope: !115)
!117 = !DILocation(line: 77, column: 21, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !12, line: 77, column: 9)
!119 = !DILocation(line: 77, column: 23, scope: !118)
!120 = !DILocation(line: 77, column: 9, scope: !115)
!121 = !DILocation(line: 79, column: 30, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !12, line: 78, column: 9)
!123 = !DILocation(line: 79, column: 23, scope: !122)
!124 = !DILocation(line: 79, column: 13, scope: !122)
!125 = !DILocation(line: 79, column: 18, scope: !122)
!126 = !DILocation(line: 79, column: 21, scope: !122)
!127 = !DILocation(line: 80, column: 9, scope: !122)
!128 = !DILocation(line: 77, column: 31, scope: !118)
!129 = !DILocation(line: 77, column: 9, scope: !118)
!130 = distinct !{!130, !120, !131, !64}
!131 = !DILocation(line: 80, column: 9, scope: !115)
!132 = !DILocation(line: 81, column: 9, scope: !107)
!133 = !DILocation(line: 81, column: 21, scope: !107)
!134 = !DILocation(line: 82, column: 19, scope: !107)
!135 = !DILocation(line: 82, column: 9, scope: !107)
!136 = !DILocation(line: 84, column: 1, scope: !93)
!137 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!138 = !DILocalVariable(name: "data", scope: !137, file: !12, line: 89, type: !16)
!139 = !DILocation(line: 89, column: 12, scope: !137)
!140 = !DILocalVariable(name: "dataBadBuffer", scope: !137, file: !12, line: 90, type: !20)
!141 = !DILocation(line: 90, column: 10, scope: !137)
!142 = !DILocalVariable(name: "dataGoodBuffer", scope: !137, file: !12, line: 91, type: !25)
!143 = !DILocation(line: 91, column: 10, scope: !137)
!144 = !DILocation(line: 95, column: 16, scope: !145)
!145 = distinct !DILexicalBlock(scope: !146, file: !12, line: 93, column: 5)
!146 = distinct !DILexicalBlock(scope: !137, file: !12, line: 92, column: 8)
!147 = !DILocation(line: 95, column: 14, scope: !145)
!148 = !DILocation(line: 96, column: 9, scope: !145)
!149 = !DILocation(line: 96, column: 17, scope: !145)
!150 = !DILocalVariable(name: "i", scope: !151, file: !12, line: 99, type: !37)
!151 = distinct !DILexicalBlock(scope: !137, file: !12, line: 98, column: 5)
!152 = !DILocation(line: 99, column: 16, scope: !151)
!153 = !DILocalVariable(name: "source", scope: !151, file: !12, line: 100, type: !25)
!154 = !DILocation(line: 100, column: 14, scope: !151)
!155 = !DILocation(line: 101, column: 9, scope: !151)
!156 = !DILocation(line: 102, column: 9, scope: !151)
!157 = !DILocation(line: 102, column: 23, scope: !151)
!158 = !DILocation(line: 104, column: 16, scope: !159)
!159 = distinct !DILexicalBlock(scope: !151, file: !12, line: 104, column: 9)
!160 = !DILocation(line: 104, column: 14, scope: !159)
!161 = !DILocation(line: 104, column: 21, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !12, line: 104, column: 9)
!163 = !DILocation(line: 104, column: 23, scope: !162)
!164 = !DILocation(line: 104, column: 9, scope: !159)
!165 = !DILocation(line: 106, column: 30, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !12, line: 105, column: 9)
!167 = !DILocation(line: 106, column: 23, scope: !166)
!168 = !DILocation(line: 106, column: 13, scope: !166)
!169 = !DILocation(line: 106, column: 18, scope: !166)
!170 = !DILocation(line: 106, column: 21, scope: !166)
!171 = !DILocation(line: 107, column: 9, scope: !166)
!172 = !DILocation(line: 104, column: 31, scope: !162)
!173 = !DILocation(line: 104, column: 9, scope: !162)
!174 = distinct !{!174, !164, !175, !64}
!175 = !DILocation(line: 107, column: 9, scope: !159)
!176 = !DILocation(line: 108, column: 9, scope: !151)
!177 = !DILocation(line: 108, column: 21, scope: !151)
!178 = !DILocation(line: 109, column: 19, scope: !151)
!179 = !DILocation(line: 109, column: 9, scope: !151)
!180 = !DILocation(line: 111, column: 1, scope: !137)
