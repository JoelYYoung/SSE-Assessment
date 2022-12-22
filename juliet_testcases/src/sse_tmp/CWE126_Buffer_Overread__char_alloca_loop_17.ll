; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_17.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_17_bad() #0 !dbg !13 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i2 = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !17, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = alloca i8, i64 50, align 16, !dbg !24
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %1 = alloca i8, i64 100, align 16, !dbg !27
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !26
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !29
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !33
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !34
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !34
  store i8 0, i8* %arrayidx1, align 1, !dbg !35
  store i32 0, i32* %i, align 4, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32, i32* %i, align 4, !dbg !39
  %cmp = icmp slt i32 %6, 1, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %dataBadBuffer, align 8, !dbg !43
  store i8* %7, i8** %data, align 8, !dbg !45
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !47
  %inc = add nsw i32 %8, 1, !dbg !47
  store i32 %inc, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !52, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !60, metadata !DIExpression()), !dbg !64
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !65
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !65
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !66
  store i8 0, i8* %arrayidx3, align 1, !dbg !67
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !68
  %call = call i64 @strlen(i8* %arraydecay4) #6, !dbg !69
  store i64 %call, i64* %destLen, align 8, !dbg !70
  store i64 0, i64* %i2, align 8, !dbg !71
  br label %for.cond5, !dbg !73

for.cond5:                                        ; preds = %for.inc10, %for.end
  %9 = load i64, i64* %i2, align 8, !dbg !74
  %10 = load i64, i64* %destLen, align 8, !dbg !76
  %cmp6 = icmp ult i64 %9, %10, !dbg !77
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !78

for.body7:                                        ; preds = %for.cond5
  %11 = load i8*, i8** %data, align 8, !dbg !79
  %12 = load i64, i64* %i2, align 8, !dbg !81
  %arrayidx8 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !79
  %13 = load i8, i8* %arrayidx8, align 1, !dbg !79
  %14 = load i64, i64* %i2, align 8, !dbg !82
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %14, !dbg !83
  store i8 %13, i8* %arrayidx9, align 1, !dbg !84
  br label %for.inc10, !dbg !85

for.inc10:                                        ; preds = %for.body7
  %15 = load i64, i64* %i2, align 8, !dbg !86
  %inc11 = add i64 %15, 1, !dbg !86
  store i64 %inc11, i64* %i2, align 8, !dbg !86
  br label %for.cond5, !dbg !87, !llvm.loop !88

for.end12:                                        ; preds = %for.cond5
  %arrayidx13 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !90
  store i8 0, i8* %arrayidx13, align 1, !dbg !91
  %arraydecay14 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !92
  call void @printLine(i8* %arraydecay14), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_17_good() #0 !dbg !95 {
entry:
  call void @goodG2B(), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !98 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !102, metadata !DIExpression()), !dbg !103
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call i64 @time(i64* null) #7, !dbg !106
  %conv = trunc i64 %call to i32, !dbg !107
  call void @srand(i32 %conv) #7, !dbg !108
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !109
  call void @CWE126_Buffer_Overread__char_alloca_loop_17_good(), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !112
  call void @CWE126_Buffer_Overread__char_alloca_loop_17_bad(), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !114
  ret i32 0, !dbg !115
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !116 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata i8** %data, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  %0 = alloca i8, i64 50, align 16, !dbg !123
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !124, metadata !DIExpression()), !dbg !125
  %1 = alloca i8, i64 100, align 16, !dbg !126
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !125
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !128
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !129
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !129
  store i8 0, i8* %arrayidx, align 1, !dbg !130
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !132
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !133
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !133
  store i8 0, i8* %arrayidx1, align 1, !dbg !134
  store i32 0, i32* %h, align 4, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32, i32* %h, align 4, !dbg !138
  %cmp = icmp slt i32 %6, 1, !dbg !140
  br i1 %cmp, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !142
  store i8* %7, i8** %data, align 8, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %h, align 4, !dbg !146
  %inc = add nsw i32 %8, 1, !dbg !146
  store i32 %inc, i32* %h, align 4, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i, metadata !150, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !153, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !155, metadata !DIExpression()), !dbg !156
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !157
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !157
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !158
  store i8 0, i8* %arrayidx2, align 1, !dbg !159
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !160
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !161
  store i64 %call, i64* %destLen, align 8, !dbg !162
  store i64 0, i64* %i, align 8, !dbg !163
  br label %for.cond4, !dbg !165

for.cond4:                                        ; preds = %for.inc9, %for.end
  %9 = load i64, i64* %i, align 8, !dbg !166
  %10 = load i64, i64* %destLen, align 8, !dbg !168
  %cmp5 = icmp ult i64 %9, %10, !dbg !169
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !170

for.body6:                                        ; preds = %for.cond4
  %11 = load i8*, i8** %data, align 8, !dbg !171
  %12 = load i64, i64* %i, align 8, !dbg !173
  %arrayidx7 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !171
  %13 = load i8, i8* %arrayidx7, align 1, !dbg !171
  %14 = load i64, i64* %i, align 8, !dbg !174
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %14, !dbg !175
  store i8 %13, i8* %arrayidx8, align 1, !dbg !176
  br label %for.inc9, !dbg !177

for.inc9:                                         ; preds = %for.body6
  %15 = load i64, i64* %i, align 8, !dbg !178
  %inc10 = add i64 %15, 1, !dbg !178
  store i64 %inc10, i64* %i, align 8, !dbg !178
  br label %for.cond4, !dbg !179, !llvm.loop !180

for.end11:                                        ; preds = %for.cond4
  %arrayidx12 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !182
  store i8 0, i8* %arrayidx12, align 1, !dbg !183
  %arraydecay13 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !184
  call void @printLine(i8* %arraydecay13), !dbg !185
  ret void, !dbg !186
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_17.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_17_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_17.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "i", scope: !13, file: !14, line: 25, type: !18)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocation(line: 25, column: 9, scope: !13)
!20 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 26, type: !4)
!21 = !DILocation(line: 26, column: 12, scope: !13)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 27, type: !4)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 36, scope: !13)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 28, type: !4)
!26 = !DILocation(line: 28, column: 12, scope: !13)
!27 = !DILocation(line: 28, column: 37, scope: !13)
!28 = !DILocation(line: 29, column: 12, scope: !13)
!29 = !DILocation(line: 29, column: 5, scope: !13)
!30 = !DILocation(line: 30, column: 5, scope: !13)
!31 = !DILocation(line: 30, column: 25, scope: !13)
!32 = !DILocation(line: 31, column: 12, scope: !13)
!33 = !DILocation(line: 31, column: 5, scope: !13)
!34 = !DILocation(line: 32, column: 5, scope: !13)
!35 = !DILocation(line: 32, column: 27, scope: !13)
!36 = !DILocation(line: 33, column: 11, scope: !37)
!37 = distinct !DILexicalBlock(scope: !13, file: !14, line: 33, column: 5)
!38 = !DILocation(line: 33, column: 9, scope: !37)
!39 = !DILocation(line: 33, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !14, line: 33, column: 5)
!41 = !DILocation(line: 33, column: 18, scope: !40)
!42 = !DILocation(line: 33, column: 5, scope: !37)
!43 = !DILocation(line: 36, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !14, line: 34, column: 5)
!45 = !DILocation(line: 36, column: 14, scope: !44)
!46 = !DILocation(line: 37, column: 5, scope: !44)
!47 = !DILocation(line: 33, column: 24, scope: !40)
!48 = !DILocation(line: 33, column: 5, scope: !40)
!49 = distinct !{!49, !42, !50, !51}
!50 = !DILocation(line: 37, column: 5, scope: !37)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocalVariable(name: "i", scope: !53, file: !14, line: 39, type: !54)
!53 = distinct !DILexicalBlock(scope: !13, file: !14, line: 38, column: 5)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !55, line: 46, baseType: !56)
!55 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!56 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!57 = !DILocation(line: 39, column: 16, scope: !53)
!58 = !DILocalVariable(name: "destLen", scope: !53, file: !14, line: 39, type: !54)
!59 = !DILocation(line: 39, column: 19, scope: !53)
!60 = !DILocalVariable(name: "dest", scope: !53, file: !14, line: 40, type: !61)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !62)
!62 = !{!63}
!63 = !DISubrange(count: 100)
!64 = !DILocation(line: 40, column: 14, scope: !53)
!65 = !DILocation(line: 41, column: 9, scope: !53)
!66 = !DILocation(line: 42, column: 9, scope: !53)
!67 = !DILocation(line: 42, column: 21, scope: !53)
!68 = !DILocation(line: 43, column: 26, scope: !53)
!69 = !DILocation(line: 43, column: 19, scope: !53)
!70 = !DILocation(line: 43, column: 17, scope: !53)
!71 = !DILocation(line: 46, column: 16, scope: !72)
!72 = distinct !DILexicalBlock(scope: !53, file: !14, line: 46, column: 9)
!73 = !DILocation(line: 46, column: 14, scope: !72)
!74 = !DILocation(line: 46, column: 21, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !14, line: 46, column: 9)
!76 = !DILocation(line: 46, column: 25, scope: !75)
!77 = !DILocation(line: 46, column: 23, scope: !75)
!78 = !DILocation(line: 46, column: 9, scope: !72)
!79 = !DILocation(line: 48, column: 23, scope: !80)
!80 = distinct !DILexicalBlock(scope: !75, file: !14, line: 47, column: 9)
!81 = !DILocation(line: 48, column: 28, scope: !80)
!82 = !DILocation(line: 48, column: 18, scope: !80)
!83 = !DILocation(line: 48, column: 13, scope: !80)
!84 = !DILocation(line: 48, column: 21, scope: !80)
!85 = !DILocation(line: 49, column: 9, scope: !80)
!86 = !DILocation(line: 46, column: 35, scope: !75)
!87 = !DILocation(line: 46, column: 9, scope: !75)
!88 = distinct !{!88, !78, !89, !51}
!89 = !DILocation(line: 49, column: 9, scope: !72)
!90 = !DILocation(line: 50, column: 9, scope: !53)
!91 = !DILocation(line: 50, column: 21, scope: !53)
!92 = !DILocation(line: 51, column: 19, scope: !53)
!93 = !DILocation(line: 51, column: 9, scope: !53)
!94 = !DILocation(line: 53, column: 1, scope: !13)
!95 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_17_good", scope: !14, file: !14, line: 92, type: !15, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocation(line: 94, column: 5, scope: !95)
!97 = !DILocation(line: 95, column: 1, scope: !95)
!98 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 107, type: !99, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DISubroutineType(types: !100)
!100 = !{!18, !18, !101}
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!102 = !DILocalVariable(name: "argc", arg: 1, scope: !98, file: !14, line: 107, type: !18)
!103 = !DILocation(line: 107, column: 14, scope: !98)
!104 = !DILocalVariable(name: "argv", arg: 2, scope: !98, file: !14, line: 107, type: !101)
!105 = !DILocation(line: 107, column: 27, scope: !98)
!106 = !DILocation(line: 110, column: 22, scope: !98)
!107 = !DILocation(line: 110, column: 12, scope: !98)
!108 = !DILocation(line: 110, column: 5, scope: !98)
!109 = !DILocation(line: 112, column: 5, scope: !98)
!110 = !DILocation(line: 113, column: 5, scope: !98)
!111 = !DILocation(line: 114, column: 5, scope: !98)
!112 = !DILocation(line: 117, column: 5, scope: !98)
!113 = !DILocation(line: 118, column: 5, scope: !98)
!114 = !DILocation(line: 119, column: 5, scope: !98)
!115 = !DILocation(line: 121, column: 5, scope: !98)
!116 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 60, type: !15, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocalVariable(name: "h", scope: !116, file: !14, line: 62, type: !18)
!118 = !DILocation(line: 62, column: 9, scope: !116)
!119 = !DILocalVariable(name: "data", scope: !116, file: !14, line: 63, type: !4)
!120 = !DILocation(line: 63, column: 12, scope: !116)
!121 = !DILocalVariable(name: "dataBadBuffer", scope: !116, file: !14, line: 64, type: !4)
!122 = !DILocation(line: 64, column: 12, scope: !116)
!123 = !DILocation(line: 64, column: 36, scope: !116)
!124 = !DILocalVariable(name: "dataGoodBuffer", scope: !116, file: !14, line: 65, type: !4)
!125 = !DILocation(line: 65, column: 12, scope: !116)
!126 = !DILocation(line: 65, column: 37, scope: !116)
!127 = !DILocation(line: 66, column: 12, scope: !116)
!128 = !DILocation(line: 66, column: 5, scope: !116)
!129 = !DILocation(line: 67, column: 5, scope: !116)
!130 = !DILocation(line: 67, column: 25, scope: !116)
!131 = !DILocation(line: 68, column: 12, scope: !116)
!132 = !DILocation(line: 68, column: 5, scope: !116)
!133 = !DILocation(line: 69, column: 5, scope: !116)
!134 = !DILocation(line: 69, column: 27, scope: !116)
!135 = !DILocation(line: 70, column: 11, scope: !136)
!136 = distinct !DILexicalBlock(scope: !116, file: !14, line: 70, column: 5)
!137 = !DILocation(line: 70, column: 9, scope: !136)
!138 = !DILocation(line: 70, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !14, line: 70, column: 5)
!140 = !DILocation(line: 70, column: 18, scope: !139)
!141 = !DILocation(line: 70, column: 5, scope: !136)
!142 = !DILocation(line: 73, column: 16, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !14, line: 71, column: 5)
!144 = !DILocation(line: 73, column: 14, scope: !143)
!145 = !DILocation(line: 74, column: 5, scope: !143)
!146 = !DILocation(line: 70, column: 24, scope: !139)
!147 = !DILocation(line: 70, column: 5, scope: !139)
!148 = distinct !{!148, !141, !149, !51}
!149 = !DILocation(line: 74, column: 5, scope: !136)
!150 = !DILocalVariable(name: "i", scope: !151, file: !14, line: 76, type: !54)
!151 = distinct !DILexicalBlock(scope: !116, file: !14, line: 75, column: 5)
!152 = !DILocation(line: 76, column: 16, scope: !151)
!153 = !DILocalVariable(name: "destLen", scope: !151, file: !14, line: 76, type: !54)
!154 = !DILocation(line: 76, column: 19, scope: !151)
!155 = !DILocalVariable(name: "dest", scope: !151, file: !14, line: 77, type: !61)
!156 = !DILocation(line: 77, column: 14, scope: !151)
!157 = !DILocation(line: 78, column: 9, scope: !151)
!158 = !DILocation(line: 79, column: 9, scope: !151)
!159 = !DILocation(line: 79, column: 21, scope: !151)
!160 = !DILocation(line: 80, column: 26, scope: !151)
!161 = !DILocation(line: 80, column: 19, scope: !151)
!162 = !DILocation(line: 80, column: 17, scope: !151)
!163 = !DILocation(line: 83, column: 16, scope: !164)
!164 = distinct !DILexicalBlock(scope: !151, file: !14, line: 83, column: 9)
!165 = !DILocation(line: 83, column: 14, scope: !164)
!166 = !DILocation(line: 83, column: 21, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !14, line: 83, column: 9)
!168 = !DILocation(line: 83, column: 25, scope: !167)
!169 = !DILocation(line: 83, column: 23, scope: !167)
!170 = !DILocation(line: 83, column: 9, scope: !164)
!171 = !DILocation(line: 85, column: 23, scope: !172)
!172 = distinct !DILexicalBlock(scope: !167, file: !14, line: 84, column: 9)
!173 = !DILocation(line: 85, column: 28, scope: !172)
!174 = !DILocation(line: 85, column: 18, scope: !172)
!175 = !DILocation(line: 85, column: 13, scope: !172)
!176 = !DILocation(line: 85, column: 21, scope: !172)
!177 = !DILocation(line: 86, column: 9, scope: !172)
!178 = !DILocation(line: 83, column: 35, scope: !167)
!179 = !DILocation(line: 83, column: 9, scope: !167)
!180 = distinct !{!180, !170, !181, !51}
!181 = !DILocation(line: 86, column: 9, scope: !164)
!182 = !DILocation(line: 87, column: 9, scope: !151)
!183 = !DILocation(line: 87, column: 21, scope: !151)
!184 = !DILocation(line: 88, column: 19, scope: !151)
!185 = !DILocation(line: 88, column: 9, scope: !151)
!186 = !DILocation(line: 90, column: 1, scope: !116)
