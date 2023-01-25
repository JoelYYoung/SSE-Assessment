; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_01_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !15, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !37, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !49
  %cmp = icmp ult i64 %0, 100, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !55
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !56
  store i32 0, i32* %intOne, align 8, !dbg !57
  %2 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !59
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !60
  store i32 0, i32* %intTwo, align 4, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %3, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !68, metadata !DIExpression()), !dbg !70
  store i64 0, i64* %i2, align 8, !dbg !71
  br label %for.cond3, !dbg !73

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !74
  %cmp4 = icmp ult i64 %4, 100, !dbg !76
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !77

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !78
  %6 = load i64, i64* %i2, align 8, !dbg !80
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !78
  %7 = load i64, i64* %i2, align 8, !dbg !81
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !82
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !82
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !82
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !82
  br label %for.inc8, !dbg !83

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !84
  %inc9 = add i64 %10, 1, !dbg !84
  store i64 %inc9, i64* %i2, align 8, !dbg !84
  br label %for.cond3, !dbg !85, !llvm.loop !86

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !88
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !88
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_01_good() #0 !dbg !91 {
entry:
  call void @goodG2B(), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !94 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !100, metadata !DIExpression()), !dbg !101
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !102, metadata !DIExpression()), !dbg !103
  %call = call i64 @time(i64* null) #5, !dbg !104
  %conv = trunc i64 %call to i32, !dbg !105
  call void @srand(i32 %conv) #5, !dbg !106
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !107
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_01_good(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !110
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_01_bad(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !112
  ret i32 0, !dbg !113
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !114 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !121
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !123, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %i, metadata !126, metadata !DIExpression()), !dbg !128
  store i64 0, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !131

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !132
  %cmp = icmp ult i64 %0, 100, !dbg !134
  br i1 %cmp, label %for.body, label %for.end, !dbg !135

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !138
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !139
  store i32 0, i32* %intOne, align 8, !dbg !140
  %2 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !142
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !143
  store i32 0, i32* %intTwo, align 4, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %3, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !150, metadata !DIExpression()), !dbg !152
  store i64 0, i64* %i2, align 8, !dbg !153
  br label %for.cond3, !dbg !155

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !156
  %cmp4 = icmp ult i64 %4, 100, !dbg !158
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !159

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !160
  %6 = load i64, i64* %i2, align 8, !dbg !162
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !160
  %7 = load i64, i64* %i2, align 8, !dbg !163
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !164
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !164
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !164
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !164
  br label %for.inc8, !dbg !165

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !166
  %inc9 = add i64 %10, 1, !dbg !166
  store i64 %inc9, i64* %i2, align 8, !dbg !166
  br label %for.cond3, !dbg !167, !llvm.loop !168

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !170
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !170
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !171
  ret void, !dbg !172
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_01_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !18, line: 100, baseType: !19)
!18 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !18, line: 96, size: 64, elements: !20)
!20 = !{!21, !23}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !19, file: !18, line: 98, baseType: !22, size: 32)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !19, file: !18, line: 99, baseType: !22, size: 32, offset: 32)
!24 = !DILocation(line: 23, column: 21, scope: !11)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 24, column: 19, scope: !11)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 25, column: 19, scope: !11)
!35 = !DILocation(line: 28, column: 12, scope: !11)
!36 = !DILocation(line: 28, column: 10, scope: !11)
!37 = !DILocalVariable(name: "source", scope: !38, file: !12, line: 30, type: !31)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!39 = !DILocation(line: 30, column: 23, scope: !38)
!40 = !DILocalVariable(name: "i", scope: !41, file: !12, line: 32, type: !42)
!41 = distinct !DILexicalBlock(scope: !38, file: !12, line: 31, column: 9)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 32, column: 20, scope: !41)
!46 = !DILocation(line: 34, column: 20, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !12, line: 34, column: 13)
!48 = !DILocation(line: 34, column: 18, scope: !47)
!49 = !DILocation(line: 34, column: 25, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !12, line: 34, column: 13)
!51 = !DILocation(line: 34, column: 27, scope: !50)
!52 = !DILocation(line: 34, column: 13, scope: !47)
!53 = !DILocation(line: 36, column: 24, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !12, line: 35, column: 13)
!55 = !DILocation(line: 36, column: 17, scope: !54)
!56 = !DILocation(line: 36, column: 27, scope: !54)
!57 = !DILocation(line: 36, column: 34, scope: !54)
!58 = !DILocation(line: 37, column: 24, scope: !54)
!59 = !DILocation(line: 37, column: 17, scope: !54)
!60 = !DILocation(line: 37, column: 27, scope: !54)
!61 = !DILocation(line: 37, column: 34, scope: !54)
!62 = !DILocation(line: 38, column: 13, scope: !54)
!63 = !DILocation(line: 34, column: 35, scope: !50)
!64 = !DILocation(line: 34, column: 13, scope: !50)
!65 = distinct !{!65, !52, !66, !67}
!66 = !DILocation(line: 38, column: 13, scope: !47)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocalVariable(name: "i", scope: !69, file: !12, line: 41, type: !42)
!69 = distinct !DILexicalBlock(scope: !38, file: !12, line: 40, column: 9)
!70 = !DILocation(line: 41, column: 20, scope: !69)
!71 = !DILocation(line: 43, column: 20, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !12, line: 43, column: 13)
!73 = !DILocation(line: 43, column: 18, scope: !72)
!74 = !DILocation(line: 43, column: 25, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !12, line: 43, column: 13)
!76 = !DILocation(line: 43, column: 27, scope: !75)
!77 = !DILocation(line: 43, column: 13, scope: !72)
!78 = !DILocation(line: 45, column: 17, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !12, line: 44, column: 13)
!80 = !DILocation(line: 45, column: 22, scope: !79)
!81 = !DILocation(line: 45, column: 34, scope: !79)
!82 = !DILocation(line: 45, column: 27, scope: !79)
!83 = !DILocation(line: 46, column: 13, scope: !79)
!84 = !DILocation(line: 43, column: 35, scope: !75)
!85 = !DILocation(line: 43, column: 13, scope: !75)
!86 = distinct !{!86, !77, !87, !67}
!87 = !DILocation(line: 46, column: 13, scope: !72)
!88 = !DILocation(line: 47, column: 30, scope: !69)
!89 = !DILocation(line: 47, column: 13, scope: !69)
!90 = !DILocation(line: 50, column: 1, scope: !11)
!91 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_01_good", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocation(line: 89, column: 5, scope: !91)
!93 = !DILocation(line: 90, column: 1, scope: !91)
!94 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 102, type: !95, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DISubroutineType(types: !96)
!96 = !{!22, !22, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!100 = !DILocalVariable(name: "argc", arg: 1, scope: !94, file: !12, line: 102, type: !22)
!101 = !DILocation(line: 102, column: 14, scope: !94)
!102 = !DILocalVariable(name: "argv", arg: 2, scope: !94, file: !12, line: 102, type: !97)
!103 = !DILocation(line: 102, column: 27, scope: !94)
!104 = !DILocation(line: 105, column: 22, scope: !94)
!105 = !DILocation(line: 105, column: 12, scope: !94)
!106 = !DILocation(line: 105, column: 5, scope: !94)
!107 = !DILocation(line: 107, column: 5, scope: !94)
!108 = !DILocation(line: 108, column: 5, scope: !94)
!109 = !DILocation(line: 109, column: 5, scope: !94)
!110 = !DILocation(line: 112, column: 5, scope: !94)
!111 = !DILocation(line: 113, column: 5, scope: !94)
!112 = !DILocation(line: 114, column: 5, scope: !94)
!113 = !DILocation(line: 116, column: 5, scope: !94)
!114 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 57, type: !13, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocalVariable(name: "data", scope: !114, file: !12, line: 59, type: !16)
!116 = !DILocation(line: 59, column: 21, scope: !114)
!117 = !DILocalVariable(name: "dataBadBuffer", scope: !114, file: !12, line: 60, type: !26)
!118 = !DILocation(line: 60, column: 19, scope: !114)
!119 = !DILocalVariable(name: "dataGoodBuffer", scope: !114, file: !12, line: 61, type: !31)
!120 = !DILocation(line: 61, column: 19, scope: !114)
!121 = !DILocation(line: 63, column: 12, scope: !114)
!122 = !DILocation(line: 63, column: 10, scope: !114)
!123 = !DILocalVariable(name: "source", scope: !124, file: !12, line: 65, type: !31)
!124 = distinct !DILexicalBlock(scope: !114, file: !12, line: 64, column: 5)
!125 = !DILocation(line: 65, column: 23, scope: !124)
!126 = !DILocalVariable(name: "i", scope: !127, file: !12, line: 67, type: !42)
!127 = distinct !DILexicalBlock(scope: !124, file: !12, line: 66, column: 9)
!128 = !DILocation(line: 67, column: 20, scope: !127)
!129 = !DILocation(line: 69, column: 20, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !12, line: 69, column: 13)
!131 = !DILocation(line: 69, column: 18, scope: !130)
!132 = !DILocation(line: 69, column: 25, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !12, line: 69, column: 13)
!134 = !DILocation(line: 69, column: 27, scope: !133)
!135 = !DILocation(line: 69, column: 13, scope: !130)
!136 = !DILocation(line: 71, column: 24, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !12, line: 70, column: 13)
!138 = !DILocation(line: 71, column: 17, scope: !137)
!139 = !DILocation(line: 71, column: 27, scope: !137)
!140 = !DILocation(line: 71, column: 34, scope: !137)
!141 = !DILocation(line: 72, column: 24, scope: !137)
!142 = !DILocation(line: 72, column: 17, scope: !137)
!143 = !DILocation(line: 72, column: 27, scope: !137)
!144 = !DILocation(line: 72, column: 34, scope: !137)
!145 = !DILocation(line: 73, column: 13, scope: !137)
!146 = !DILocation(line: 69, column: 35, scope: !133)
!147 = !DILocation(line: 69, column: 13, scope: !133)
!148 = distinct !{!148, !135, !149, !67}
!149 = !DILocation(line: 73, column: 13, scope: !130)
!150 = !DILocalVariable(name: "i", scope: !151, file: !12, line: 76, type: !42)
!151 = distinct !DILexicalBlock(scope: !124, file: !12, line: 75, column: 9)
!152 = !DILocation(line: 76, column: 20, scope: !151)
!153 = !DILocation(line: 78, column: 20, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !12, line: 78, column: 13)
!155 = !DILocation(line: 78, column: 18, scope: !154)
!156 = !DILocation(line: 78, column: 25, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !12, line: 78, column: 13)
!158 = !DILocation(line: 78, column: 27, scope: !157)
!159 = !DILocation(line: 78, column: 13, scope: !154)
!160 = !DILocation(line: 80, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !12, line: 79, column: 13)
!162 = !DILocation(line: 80, column: 22, scope: !161)
!163 = !DILocation(line: 80, column: 34, scope: !161)
!164 = !DILocation(line: 80, column: 27, scope: !161)
!165 = !DILocation(line: 81, column: 13, scope: !161)
!166 = !DILocation(line: 78, column: 35, scope: !157)
!167 = !DILocation(line: 78, column: 13, scope: !157)
!168 = distinct !{!168, !159, !169, !67}
!169 = !DILocation(line: 81, column: 13, scope: !154)
!170 = !DILocation(line: 82, column: 30, scope: !151)
!171 = !DILocation(line: 82, column: 13, scope: !151)
!172 = !DILocation(line: 85, column: 1, scope: !114)
