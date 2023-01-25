; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_12_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !15, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !35
  %tobool = icmp ne i32 %call, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.else, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !42
  store %struct._twoIntsStruct* %arraydecay1, %struct._twoIntsStruct** %data, align 8, !dbg !44
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !45, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !57
  %cmp = icmp ult i64 %0, 100, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !63
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !64
  store i32 0, i32* %intOne, align 8, !dbg !65
  %2 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !67
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !68
  store i32 0, i32* %intTwo, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %3, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !76
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !77
  %arraydecay3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !77
  %6 = bitcast %struct._twoIntsStruct* %arraydecay3 to i8*, !dbg !77
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 800, i1 false), !dbg !77
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !78
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 0, !dbg !78
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx4), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_12_good() #0 !dbg !81 {
entry:
  call void @goodG2B(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_12_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_12_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !111
  %tobool = icmp ne i32 %call, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !114
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !116
  br label %if.end, !dbg !117

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !118
  store %struct._twoIntsStruct* %arraydecay1, %struct._twoIntsStruct** %data, align 8, !dbg !120
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !121, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !126
  store i64 0, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !130
  %cmp = icmp ult i64 %0, 100, !dbg !132
  br i1 %cmp, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !136
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !137
  store i32 0, i32* %intOne, align 8, !dbg !138
  %2 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !140
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !141
  store i32 0, i32* %intTwo, align 4, !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !144
  %inc = add i64 %3, 1, !dbg !144
  store i64 %inc, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !148
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !149
  %arraydecay3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !149
  %6 = bitcast %struct._twoIntsStruct* %arraydecay3 to i8*, !dbg !149
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 800, i1 false), !dbg !149
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !150
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 0, !dbg !150
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx4), !dbg !151
  ret void, !dbg !152
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_12_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!35 = !DILocation(line: 26, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 26, column: 8)
!37 = !DILocation(line: 26, column: 8, scope: !11)
!38 = !DILocation(line: 30, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 27, column: 5)
!40 = !DILocation(line: 30, column: 14, scope: !39)
!41 = !DILocation(line: 31, column: 5, scope: !39)
!42 = !DILocation(line: 35, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !36, file: !12, line: 33, column: 5)
!44 = !DILocation(line: 35, column: 14, scope: !43)
!45 = !DILocalVariable(name: "source", scope: !46, file: !12, line: 38, type: !31)
!46 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!47 = !DILocation(line: 38, column: 23, scope: !46)
!48 = !DILocalVariable(name: "i", scope: !49, file: !12, line: 40, type: !50)
!49 = distinct !DILexicalBlock(scope: !46, file: !12, line: 39, column: 9)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !51, line: 46, baseType: !52)
!51 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!52 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 40, column: 20, scope: !49)
!54 = !DILocation(line: 42, column: 20, scope: !55)
!55 = distinct !DILexicalBlock(scope: !49, file: !12, line: 42, column: 13)
!56 = !DILocation(line: 42, column: 18, scope: !55)
!57 = !DILocation(line: 42, column: 25, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !12, line: 42, column: 13)
!59 = !DILocation(line: 42, column: 27, scope: !58)
!60 = !DILocation(line: 42, column: 13, scope: !55)
!61 = !DILocation(line: 44, column: 24, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !12, line: 43, column: 13)
!63 = !DILocation(line: 44, column: 17, scope: !62)
!64 = !DILocation(line: 44, column: 27, scope: !62)
!65 = !DILocation(line: 44, column: 34, scope: !62)
!66 = !DILocation(line: 45, column: 24, scope: !62)
!67 = !DILocation(line: 45, column: 17, scope: !62)
!68 = !DILocation(line: 45, column: 27, scope: !62)
!69 = !DILocation(line: 45, column: 34, scope: !62)
!70 = !DILocation(line: 46, column: 13, scope: !62)
!71 = !DILocation(line: 42, column: 35, scope: !58)
!72 = !DILocation(line: 42, column: 13, scope: !58)
!73 = distinct !{!73, !60, !74, !75}
!74 = !DILocation(line: 46, column: 13, scope: !55)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 49, column: 16, scope: !46)
!77 = !DILocation(line: 49, column: 9, scope: !46)
!78 = !DILocation(line: 50, column: 26, scope: !46)
!79 = !DILocation(line: 50, column: 9, scope: !46)
!80 = !DILocation(line: 52, column: 1, scope: !11)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_12_good", scope: !12, file: !12, line: 92, type: !13, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 94, column: 5, scope: !81)
!83 = !DILocation(line: 95, column: 1, scope: !81)
!84 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 107, type: !85, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!22, !22, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !12, line: 107, type: !22)
!91 = !DILocation(line: 107, column: 14, scope: !84)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !12, line: 107, type: !87)
!93 = !DILocation(line: 107, column: 27, scope: !84)
!94 = !DILocation(line: 110, column: 22, scope: !84)
!95 = !DILocation(line: 110, column: 12, scope: !84)
!96 = !DILocation(line: 110, column: 5, scope: !84)
!97 = !DILocation(line: 112, column: 5, scope: !84)
!98 = !DILocation(line: 113, column: 5, scope: !84)
!99 = !DILocation(line: 114, column: 5, scope: !84)
!100 = !DILocation(line: 117, column: 5, scope: !84)
!101 = !DILocation(line: 118, column: 5, scope: !84)
!102 = !DILocation(line: 119, column: 5, scope: !84)
!103 = !DILocation(line: 121, column: 5, scope: !84)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 62, type: !16)
!106 = !DILocation(line: 62, column: 21, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !12, line: 63, type: !26)
!108 = !DILocation(line: 63, column: 19, scope: !104)
!109 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !12, line: 64, type: !31)
!110 = !DILocation(line: 64, column: 19, scope: !104)
!111 = !DILocation(line: 65, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !104, file: !12, line: 65, column: 8)
!113 = !DILocation(line: 65, column: 8, scope: !104)
!114 = !DILocation(line: 68, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !12, line: 66, column: 5)
!116 = !DILocation(line: 68, column: 14, scope: !115)
!117 = !DILocation(line: 69, column: 5, scope: !115)
!118 = !DILocation(line: 73, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !112, file: !12, line: 71, column: 5)
!120 = !DILocation(line: 73, column: 14, scope: !119)
!121 = !DILocalVariable(name: "source", scope: !122, file: !12, line: 76, type: !31)
!122 = distinct !DILexicalBlock(scope: !104, file: !12, line: 75, column: 5)
!123 = !DILocation(line: 76, column: 23, scope: !122)
!124 = !DILocalVariable(name: "i", scope: !125, file: !12, line: 78, type: !50)
!125 = distinct !DILexicalBlock(scope: !122, file: !12, line: 77, column: 9)
!126 = !DILocation(line: 78, column: 20, scope: !125)
!127 = !DILocation(line: 80, column: 20, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !12, line: 80, column: 13)
!129 = !DILocation(line: 80, column: 18, scope: !128)
!130 = !DILocation(line: 80, column: 25, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !12, line: 80, column: 13)
!132 = !DILocation(line: 80, column: 27, scope: !131)
!133 = !DILocation(line: 80, column: 13, scope: !128)
!134 = !DILocation(line: 82, column: 24, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !12, line: 81, column: 13)
!136 = !DILocation(line: 82, column: 17, scope: !135)
!137 = !DILocation(line: 82, column: 27, scope: !135)
!138 = !DILocation(line: 82, column: 34, scope: !135)
!139 = !DILocation(line: 83, column: 24, scope: !135)
!140 = !DILocation(line: 83, column: 17, scope: !135)
!141 = !DILocation(line: 83, column: 27, scope: !135)
!142 = !DILocation(line: 83, column: 34, scope: !135)
!143 = !DILocation(line: 84, column: 13, scope: !135)
!144 = !DILocation(line: 80, column: 35, scope: !131)
!145 = !DILocation(line: 80, column: 13, scope: !131)
!146 = distinct !{!146, !133, !147, !75}
!147 = !DILocation(line: 84, column: 13, scope: !128)
!148 = !DILocation(line: 87, column: 16, scope: !122)
!149 = !DILocation(line: 87, column: 9, scope: !122)
!150 = !DILocation(line: 88, column: 26, scope: !122)
!151 = !DILocation(line: 88, column: 9, scope: !122)
!152 = !DILocation(line: 90, column: 1, scope: !104)
