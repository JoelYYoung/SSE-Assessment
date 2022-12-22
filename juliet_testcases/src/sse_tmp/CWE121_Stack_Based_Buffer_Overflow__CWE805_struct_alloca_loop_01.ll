; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_01_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 400, align 16, !dbg !27
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !28
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %2 = alloca i8, i64 800, align 16, !dbg !31
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !32
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !30
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !33
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !50
  %cmp = icmp ult i64 %5, 100, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !56
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !57
  store i32 0, i32* %intOne, align 8, !dbg !58
  %7 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !60
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !61
  store i32 0, i32* %intTwo, align 4, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %8, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !69, metadata !DIExpression()), !dbg !71
  store i64 0, i64* %i2, align 8, !dbg !72
  br label %for.cond3, !dbg !74

for.cond3:                                        ; preds = %for.inc8, %for.end
  %9 = load i64, i64* %i2, align 8, !dbg !75
  %cmp4 = icmp ult i64 %9, 100, !dbg !77
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !78

for.body5:                                        ; preds = %for.cond3
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !79
  %11 = load i64, i64* %i2, align 8, !dbg !81
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 %11, !dbg !79
  %12 = load i64, i64* %i2, align 8, !dbg !82
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %12, !dbg !83
  %13 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !83
  %14 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !83
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 8 %14, i64 8, i1 false), !dbg !83
  br label %for.inc8, !dbg !84

for.inc8:                                         ; preds = %for.body5
  %15 = load i64, i64* %i2, align 8, !dbg !85
  %inc9 = add i64 %15, 1, !dbg !85
  store i64 %inc9, i64* %i2, align 8, !dbg !85
  br label %for.cond3, !dbg !86, !llvm.loop !87

for.end10:                                        ; preds = %for.cond3
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !89
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !89
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_01_good() #0 !dbg !92 {
entry:
  call void @goodG2B(), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !95 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !101, metadata !DIExpression()), !dbg !102
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call i64 @time(i64* null) #5, !dbg !105
  %conv = trunc i64 %call to i32, !dbg !106
  call void @srand(i32 %conv) #5, !dbg !107
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !108
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_01_good(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_01_bad(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !113
  ret i32 0, !dbg !114
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !115 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %0 = alloca i8, i64 400, align 16, !dbg !120
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !121
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !122, metadata !DIExpression()), !dbg !123
  %2 = alloca i8, i64 800, align 16, !dbg !124
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !125
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !123
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !126
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !137
  %cmp = icmp ult i64 %5, 100, !dbg !139
  br i1 %cmp, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !143
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !144
  store i32 0, i32* %intOne, align 8, !dbg !145
  %7 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !147
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !148
  store i32 0, i32* %intTwo, align 4, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %8, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !155, metadata !DIExpression()), !dbg !157
  store i64 0, i64* %i2, align 8, !dbg !158
  br label %for.cond3, !dbg !160

for.cond3:                                        ; preds = %for.inc8, %for.end
  %9 = load i64, i64* %i2, align 8, !dbg !161
  %cmp4 = icmp ult i64 %9, 100, !dbg !163
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !164

for.body5:                                        ; preds = %for.cond3
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !165
  %11 = load i64, i64* %i2, align 8, !dbg !167
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 %11, !dbg !165
  %12 = load i64, i64* %i2, align 8, !dbg !168
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %12, !dbg !169
  %13 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !169
  %14 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !169
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 8 %14, i64 8, i1 false), !dbg !169
  br label %for.inc8, !dbg !170

for.inc8:                                         ; preds = %for.body5
  %15 = load i64, i64* %i2, align 8, !dbg !171
  %inc9 = add i64 %15, 1, !dbg !171
  store i64 %inc9, i64* %i2, align 8, !dbg !171
  br label %for.cond3, !dbg !172, !llvm.loop !173

for.end10:                                        ; preds = %for.cond3
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !175
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !175
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !176
  ret void, !dbg !177
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 96, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 98, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 99, baseType: !10, size: 32, offset: 32)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_01_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_01.c", directory: "/root/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 23, type: !4)
!24 = !DILocation(line: 23, column: 21, scope: !19)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 24, type: !4)
!26 = !DILocation(line: 24, column: 21, scope: !19)
!27 = !DILocation(line: 24, column: 54, scope: !19)
!28 = !DILocation(line: 24, column: 37, scope: !19)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 25, type: !4)
!30 = !DILocation(line: 25, column: 21, scope: !19)
!31 = !DILocation(line: 25, column: 55, scope: !19)
!32 = !DILocation(line: 25, column: 38, scope: !19)
!33 = !DILocation(line: 28, column: 12, scope: !19)
!34 = !DILocation(line: 28, column: 10, scope: !19)
!35 = !DILocalVariable(name: "source", scope: !36, file: !20, line: 30, type: !37)
!36 = distinct !DILexicalBlock(scope: !19, file: !20, line: 29, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 30, column: 23, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !42, file: !20, line: 32, type: !43)
!42 = distinct !DILexicalBlock(scope: !36, file: !20, line: 31, column: 9)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 32, column: 20, scope: !42)
!47 = !DILocation(line: 34, column: 20, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !20, line: 34, column: 13)
!49 = !DILocation(line: 34, column: 18, scope: !48)
!50 = !DILocation(line: 34, column: 25, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !20, line: 34, column: 13)
!52 = !DILocation(line: 34, column: 27, scope: !51)
!53 = !DILocation(line: 34, column: 13, scope: !48)
!54 = !DILocation(line: 36, column: 24, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !20, line: 35, column: 13)
!56 = !DILocation(line: 36, column: 17, scope: !55)
!57 = !DILocation(line: 36, column: 27, scope: !55)
!58 = !DILocation(line: 36, column: 34, scope: !55)
!59 = !DILocation(line: 37, column: 24, scope: !55)
!60 = !DILocation(line: 37, column: 17, scope: !55)
!61 = !DILocation(line: 37, column: 27, scope: !55)
!62 = !DILocation(line: 37, column: 34, scope: !55)
!63 = !DILocation(line: 38, column: 13, scope: !55)
!64 = !DILocation(line: 34, column: 35, scope: !51)
!65 = !DILocation(line: 34, column: 13, scope: !51)
!66 = distinct !{!66, !53, !67, !68}
!67 = !DILocation(line: 38, column: 13, scope: !48)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocalVariable(name: "i", scope: !70, file: !20, line: 41, type: !43)
!70 = distinct !DILexicalBlock(scope: !36, file: !20, line: 40, column: 9)
!71 = !DILocation(line: 41, column: 20, scope: !70)
!72 = !DILocation(line: 43, column: 20, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !20, line: 43, column: 13)
!74 = !DILocation(line: 43, column: 18, scope: !73)
!75 = !DILocation(line: 43, column: 25, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !20, line: 43, column: 13)
!77 = !DILocation(line: 43, column: 27, scope: !76)
!78 = !DILocation(line: 43, column: 13, scope: !73)
!79 = !DILocation(line: 45, column: 17, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !20, line: 44, column: 13)
!81 = !DILocation(line: 45, column: 22, scope: !80)
!82 = !DILocation(line: 45, column: 34, scope: !80)
!83 = !DILocation(line: 45, column: 27, scope: !80)
!84 = !DILocation(line: 46, column: 13, scope: !80)
!85 = !DILocation(line: 43, column: 35, scope: !76)
!86 = !DILocation(line: 43, column: 13, scope: !76)
!87 = distinct !{!87, !78, !88, !68}
!88 = !DILocation(line: 46, column: 13, scope: !73)
!89 = !DILocation(line: 47, column: 30, scope: !70)
!90 = !DILocation(line: 47, column: 13, scope: !70)
!91 = !DILocation(line: 50, column: 1, scope: !19)
!92 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_01_good", scope: !20, file: !20, line: 87, type: !21, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocation(line: 89, column: 5, scope: !92)
!94 = !DILocation(line: 90, column: 1, scope: !92)
!95 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 102, type: !96, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DISubroutineType(types: !97)
!97 = !{!10, !10, !98}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !95, file: !20, line: 102, type: !10)
!102 = !DILocation(line: 102, column: 14, scope: !95)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !95, file: !20, line: 102, type: !98)
!104 = !DILocation(line: 102, column: 27, scope: !95)
!105 = !DILocation(line: 105, column: 22, scope: !95)
!106 = !DILocation(line: 105, column: 12, scope: !95)
!107 = !DILocation(line: 105, column: 5, scope: !95)
!108 = !DILocation(line: 107, column: 5, scope: !95)
!109 = !DILocation(line: 108, column: 5, scope: !95)
!110 = !DILocation(line: 109, column: 5, scope: !95)
!111 = !DILocation(line: 112, column: 5, scope: !95)
!112 = !DILocation(line: 113, column: 5, scope: !95)
!113 = !DILocation(line: 114, column: 5, scope: !95)
!114 = !DILocation(line: 116, column: 5, scope: !95)
!115 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 57, type: !21, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "data", scope: !115, file: !20, line: 59, type: !4)
!117 = !DILocation(line: 59, column: 21, scope: !115)
!118 = !DILocalVariable(name: "dataBadBuffer", scope: !115, file: !20, line: 60, type: !4)
!119 = !DILocation(line: 60, column: 21, scope: !115)
!120 = !DILocation(line: 60, column: 54, scope: !115)
!121 = !DILocation(line: 60, column: 37, scope: !115)
!122 = !DILocalVariable(name: "dataGoodBuffer", scope: !115, file: !20, line: 61, type: !4)
!123 = !DILocation(line: 61, column: 21, scope: !115)
!124 = !DILocation(line: 61, column: 55, scope: !115)
!125 = !DILocation(line: 61, column: 38, scope: !115)
!126 = !DILocation(line: 63, column: 12, scope: !115)
!127 = !DILocation(line: 63, column: 10, scope: !115)
!128 = !DILocalVariable(name: "source", scope: !129, file: !20, line: 65, type: !37)
!129 = distinct !DILexicalBlock(scope: !115, file: !20, line: 64, column: 5)
!130 = !DILocation(line: 65, column: 23, scope: !129)
!131 = !DILocalVariable(name: "i", scope: !132, file: !20, line: 67, type: !43)
!132 = distinct !DILexicalBlock(scope: !129, file: !20, line: 66, column: 9)
!133 = !DILocation(line: 67, column: 20, scope: !132)
!134 = !DILocation(line: 69, column: 20, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !20, line: 69, column: 13)
!136 = !DILocation(line: 69, column: 18, scope: !135)
!137 = !DILocation(line: 69, column: 25, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !20, line: 69, column: 13)
!139 = !DILocation(line: 69, column: 27, scope: !138)
!140 = !DILocation(line: 69, column: 13, scope: !135)
!141 = !DILocation(line: 71, column: 24, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !20, line: 70, column: 13)
!143 = !DILocation(line: 71, column: 17, scope: !142)
!144 = !DILocation(line: 71, column: 27, scope: !142)
!145 = !DILocation(line: 71, column: 34, scope: !142)
!146 = !DILocation(line: 72, column: 24, scope: !142)
!147 = !DILocation(line: 72, column: 17, scope: !142)
!148 = !DILocation(line: 72, column: 27, scope: !142)
!149 = !DILocation(line: 72, column: 34, scope: !142)
!150 = !DILocation(line: 73, column: 13, scope: !142)
!151 = !DILocation(line: 69, column: 35, scope: !138)
!152 = !DILocation(line: 69, column: 13, scope: !138)
!153 = distinct !{!153, !140, !154, !68}
!154 = !DILocation(line: 73, column: 13, scope: !135)
!155 = !DILocalVariable(name: "i", scope: !156, file: !20, line: 76, type: !43)
!156 = distinct !DILexicalBlock(scope: !129, file: !20, line: 75, column: 9)
!157 = !DILocation(line: 76, column: 20, scope: !156)
!158 = !DILocation(line: 78, column: 20, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !20, line: 78, column: 13)
!160 = !DILocation(line: 78, column: 18, scope: !159)
!161 = !DILocation(line: 78, column: 25, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !20, line: 78, column: 13)
!163 = !DILocation(line: 78, column: 27, scope: !162)
!164 = !DILocation(line: 78, column: 13, scope: !159)
!165 = !DILocation(line: 80, column: 17, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !20, line: 79, column: 13)
!167 = !DILocation(line: 80, column: 22, scope: !166)
!168 = !DILocation(line: 80, column: 34, scope: !166)
!169 = !DILocation(line: 80, column: 27, scope: !166)
!170 = !DILocation(line: 81, column: 13, scope: !166)
!171 = !DILocation(line: 78, column: 35, scope: !162)
!172 = !DILocation(line: 78, column: 13, scope: !162)
!173 = distinct !{!173, !164, !174, !68}
!174 = !DILocation(line: 81, column: 13, scope: !159)
!175 = !DILocation(line: 82, column: 30, scope: !156)
!176 = !DILocation(line: 82, column: 13, scope: !156)
!177 = !DILocation(line: 85, column: 1, scope: !115)
