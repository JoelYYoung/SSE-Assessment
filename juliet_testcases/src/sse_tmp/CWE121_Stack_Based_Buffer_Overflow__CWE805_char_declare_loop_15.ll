; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_15_bad() #0 !dbg !11 {
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
  store i8* %arraydecay, i8** %data, align 8, !dbg !30
  %0 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !40
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !41
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !42
  store i8 0, i8* %arrayidx2, align 1, !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !47
  %cmp = icmp ult i64 %1, 100, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !53
  %3 = load i8, i8* %arrayidx3, align 1, !dbg !53
  %4 = load i8*, i8** %data, align 8, !dbg !54
  %5 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !54
  store i8 %3, i8* %arrayidx4, align 1, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %6, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !63
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !63
  store i8 0, i8* %arrayidx5, align 1, !dbg !64
  %8 = load i8*, i8** %data, align 8, !dbg !65
  call void @printLine(i8* %8), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_15_good() #0 !dbg !68 {
entry:
  call void @goodG2B1(), !dbg !69
  call void @goodG2B2(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #5, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #5, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_15_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_15_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !91 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !98
  store i8* %arraydecay, i8** %data, align 8, !dbg !99
  %0 = load i8*, i8** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  call void @llvm.dbg.declare(metadata i64* %i, metadata !102, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !105, metadata !DIExpression()), !dbg !106
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !107
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !108
  store i8 0, i8* %arrayidx2, align 1, !dbg !109
  store i64 0, i64* %i, align 8, !dbg !110
  br label %for.cond, !dbg !112

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !113
  %cmp = icmp ult i64 %1, 100, !dbg !115
  br i1 %cmp, label %for.body, label %for.end, !dbg !116

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !117
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !119
  %3 = load i8, i8* %arrayidx3, align 1, !dbg !119
  %4 = load i8*, i8** %data, align 8, !dbg !120
  %5 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !120
  store i8 %3, i8* %arrayidx4, align 1, !dbg !122
  br label %for.inc, !dbg !123

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !124
  %inc = add i64 %6, 1, !dbg !124
  store i64 %inc, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !125, !llvm.loop !126

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !128
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !128
  store i8 0, i8* %arrayidx5, align 1, !dbg !129
  %8 = load i8*, i8** %data, align 8, !dbg !130
  call void @printLine(i8* %8), !dbg !131
  ret void, !dbg !132
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !133 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !140
  store i8* %arraydecay, i8** %data, align 8, !dbg !141
  %0 = load i8*, i8** %data, align 8, !dbg !142
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !142
  store i8 0, i8* %arrayidx, align 1, !dbg !143
  call void @llvm.dbg.declare(metadata i64* %i, metadata !144, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !147, metadata !DIExpression()), !dbg !148
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !149
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !149
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !150
  store i8 0, i8* %arrayidx2, align 1, !dbg !151
  store i64 0, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !154

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !155
  %cmp = icmp ult i64 %1, 100, !dbg !157
  br i1 %cmp, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !161
  %3 = load i8, i8* %arrayidx3, align 1, !dbg !161
  %4 = load i8*, i8** %data, align 8, !dbg !162
  %5 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !162
  store i8 %3, i8* %arrayidx4, align 1, !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !166
  %inc = add i64 %6, 1, !dbg !166
  store i64 %inc, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !170
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !170
  store i8 0, i8* %arrayidx5, align 1, !dbg !171
  %8 = load i8*, i8** %data, align 8, !dbg !172
  call void @printLine(i8* %8), !dbg !173
  ret void, !dbg !174
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_15.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_15.c", directory: "/root/SSE-Assessment")
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
!29 = !DILocation(line: 33, column: 16, scope: !11)
!30 = !DILocation(line: 33, column: 14, scope: !11)
!31 = !DILocation(line: 34, column: 9, scope: !11)
!32 = !DILocation(line: 34, column: 17, scope: !11)
!33 = !DILocalVariable(name: "i", scope: !34, file: !12, line: 42, type: !35)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 42, column: 16, scope: !34)
!39 = !DILocalVariable(name: "source", scope: !34, file: !12, line: 43, type: !25)
!40 = !DILocation(line: 43, column: 14, scope: !34)
!41 = !DILocation(line: 44, column: 9, scope: !34)
!42 = !DILocation(line: 45, column: 9, scope: !34)
!43 = !DILocation(line: 45, column: 23, scope: !34)
!44 = !DILocation(line: 47, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !34, file: !12, line: 47, column: 9)
!46 = !DILocation(line: 47, column: 14, scope: !45)
!47 = !DILocation(line: 47, column: 21, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !12, line: 47, column: 9)
!49 = !DILocation(line: 47, column: 23, scope: !48)
!50 = !DILocation(line: 47, column: 9, scope: !45)
!51 = !DILocation(line: 49, column: 30, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !12, line: 48, column: 9)
!53 = !DILocation(line: 49, column: 23, scope: !52)
!54 = !DILocation(line: 49, column: 13, scope: !52)
!55 = !DILocation(line: 49, column: 18, scope: !52)
!56 = !DILocation(line: 49, column: 21, scope: !52)
!57 = !DILocation(line: 50, column: 9, scope: !52)
!58 = !DILocation(line: 47, column: 31, scope: !48)
!59 = !DILocation(line: 47, column: 9, scope: !48)
!60 = distinct !{!60, !50, !61, !62}
!61 = !DILocation(line: 50, column: 9, scope: !45)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 51, column: 9, scope: !34)
!64 = !DILocation(line: 51, column: 21, scope: !34)
!65 = !DILocation(line: 52, column: 19, scope: !34)
!66 = !DILocation(line: 52, column: 9, scope: !34)
!67 = !DILocation(line: 54, column: 1, scope: !11)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_15_good", scope: !12, file: !12, line: 126, type: !13, scopeLine: 127, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 128, column: 5, scope: !68)
!70 = !DILocation(line: 129, column: 5, scope: !68)
!71 = !DILocation(line: 130, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 142, type: !73, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!75, !75, !76}
!75 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !12, line: 142, type: !75)
!78 = !DILocation(line: 142, column: 14, scope: !72)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !12, line: 142, type: !76)
!80 = !DILocation(line: 142, column: 27, scope: !72)
!81 = !DILocation(line: 145, column: 22, scope: !72)
!82 = !DILocation(line: 145, column: 12, scope: !72)
!83 = !DILocation(line: 145, column: 5, scope: !72)
!84 = !DILocation(line: 147, column: 5, scope: !72)
!85 = !DILocation(line: 148, column: 5, scope: !72)
!86 = !DILocation(line: 149, column: 5, scope: !72)
!87 = !DILocation(line: 152, column: 5, scope: !72)
!88 = !DILocation(line: 153, column: 5, scope: !72)
!89 = !DILocation(line: 154, column: 5, scope: !72)
!90 = !DILocation(line: 156, column: 5, scope: !72)
!91 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !12, line: 63, type: !16)
!93 = !DILocation(line: 63, column: 12, scope: !91)
!94 = !DILocalVariable(name: "dataBadBuffer", scope: !91, file: !12, line: 64, type: !20)
!95 = !DILocation(line: 64, column: 10, scope: !91)
!96 = !DILocalVariable(name: "dataGoodBuffer", scope: !91, file: !12, line: 65, type: !25)
!97 = !DILocation(line: 65, column: 10, scope: !91)
!98 = !DILocation(line: 74, column: 16, scope: !91)
!99 = !DILocation(line: 74, column: 14, scope: !91)
!100 = !DILocation(line: 75, column: 9, scope: !91)
!101 = !DILocation(line: 75, column: 17, scope: !91)
!102 = !DILocalVariable(name: "i", scope: !103, file: !12, line: 79, type: !35)
!103 = distinct !DILexicalBlock(scope: !91, file: !12, line: 78, column: 5)
!104 = !DILocation(line: 79, column: 16, scope: !103)
!105 = !DILocalVariable(name: "source", scope: !103, file: !12, line: 80, type: !25)
!106 = !DILocation(line: 80, column: 14, scope: !103)
!107 = !DILocation(line: 81, column: 9, scope: !103)
!108 = !DILocation(line: 82, column: 9, scope: !103)
!109 = !DILocation(line: 82, column: 23, scope: !103)
!110 = !DILocation(line: 84, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !103, file: !12, line: 84, column: 9)
!112 = !DILocation(line: 84, column: 14, scope: !111)
!113 = !DILocation(line: 84, column: 21, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !12, line: 84, column: 9)
!115 = !DILocation(line: 84, column: 23, scope: !114)
!116 = !DILocation(line: 84, column: 9, scope: !111)
!117 = !DILocation(line: 86, column: 30, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !12, line: 85, column: 9)
!119 = !DILocation(line: 86, column: 23, scope: !118)
!120 = !DILocation(line: 86, column: 13, scope: !118)
!121 = !DILocation(line: 86, column: 18, scope: !118)
!122 = !DILocation(line: 86, column: 21, scope: !118)
!123 = !DILocation(line: 87, column: 9, scope: !118)
!124 = !DILocation(line: 84, column: 31, scope: !114)
!125 = !DILocation(line: 84, column: 9, scope: !114)
!126 = distinct !{!126, !116, !127, !62}
!127 = !DILocation(line: 87, column: 9, scope: !111)
!128 = !DILocation(line: 88, column: 9, scope: !103)
!129 = !DILocation(line: 88, column: 21, scope: !103)
!130 = !DILocation(line: 89, column: 19, scope: !103)
!131 = !DILocation(line: 89, column: 9, scope: !103)
!132 = !DILocation(line: 91, column: 1, scope: !91)
!133 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 94, type: !13, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!134 = !DILocalVariable(name: "data", scope: !133, file: !12, line: 96, type: !16)
!135 = !DILocation(line: 96, column: 12, scope: !133)
!136 = !DILocalVariable(name: "dataBadBuffer", scope: !133, file: !12, line: 97, type: !20)
!137 = !DILocation(line: 97, column: 10, scope: !133)
!138 = !DILocalVariable(name: "dataGoodBuffer", scope: !133, file: !12, line: 98, type: !25)
!139 = !DILocation(line: 98, column: 10, scope: !133)
!140 = !DILocation(line: 103, column: 16, scope: !133)
!141 = !DILocation(line: 103, column: 14, scope: !133)
!142 = !DILocation(line: 104, column: 9, scope: !133)
!143 = !DILocation(line: 104, column: 17, scope: !133)
!144 = !DILocalVariable(name: "i", scope: !145, file: !12, line: 112, type: !35)
!145 = distinct !DILexicalBlock(scope: !133, file: !12, line: 111, column: 5)
!146 = !DILocation(line: 112, column: 16, scope: !145)
!147 = !DILocalVariable(name: "source", scope: !145, file: !12, line: 113, type: !25)
!148 = !DILocation(line: 113, column: 14, scope: !145)
!149 = !DILocation(line: 114, column: 9, scope: !145)
!150 = !DILocation(line: 115, column: 9, scope: !145)
!151 = !DILocation(line: 115, column: 23, scope: !145)
!152 = !DILocation(line: 117, column: 16, scope: !153)
!153 = distinct !DILexicalBlock(scope: !145, file: !12, line: 117, column: 9)
!154 = !DILocation(line: 117, column: 14, scope: !153)
!155 = !DILocation(line: 117, column: 21, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !12, line: 117, column: 9)
!157 = !DILocation(line: 117, column: 23, scope: !156)
!158 = !DILocation(line: 117, column: 9, scope: !153)
!159 = !DILocation(line: 119, column: 30, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !12, line: 118, column: 9)
!161 = !DILocation(line: 119, column: 23, scope: !160)
!162 = !DILocation(line: 119, column: 13, scope: !160)
!163 = !DILocation(line: 119, column: 18, scope: !160)
!164 = !DILocation(line: 119, column: 21, scope: !160)
!165 = !DILocation(line: 120, column: 9, scope: !160)
!166 = !DILocation(line: 117, column: 31, scope: !156)
!167 = !DILocation(line: 117, column: 9, scope: !156)
!168 = distinct !{!168, !158, !169, !62}
!169 = !DILocation(line: 120, column: 9, scope: !153)
!170 = !DILocation(line: 121, column: 9, scope: !145)
!171 = !DILocation(line: 121, column: 21, scope: !145)
!172 = !DILocation(line: 122, column: 19, scope: !145)
!173 = !DILocation(line: 122, column: 9, scope: !145)
!174 = !DILocation(line: 124, column: 1, scope: !133)
