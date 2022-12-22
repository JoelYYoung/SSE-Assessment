; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_18.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i32], i8*, i8* }

@.str = private unnamed_addr constant [32 x i32] [i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_18_bad() #0 !dbg !16 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  br label %sink, !dbg !20

sink:                                             ; preds = %entry
  call void @llvm.dbg.label(metadata !21), !dbg !22
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !23, metadata !DIExpression()), !dbg !34
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !35
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !36
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !37
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !37
  %1 = bitcast i8* %0 to i32*, !dbg !38
  call void @printWLine(i32* %1), !dbg !39
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !40
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !41
  %2 = bitcast i32* %arraydecay to i8*, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !41
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !42
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !45
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !46
  call void @printWLine(i32* %arraydecay4), !dbg !47
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !48
  %3 = load i8*, i8** %voidSecond5, align 8, !dbg !48
  %4 = bitcast i8* %3 to i32*, !dbg !49
  call void @printWLine(i32* %4), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printWLine(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_18_good() #0 !dbg !52 {
entry:
  call void @good1(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #5, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #5, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_18_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_18_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !75 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  br label %sink, !dbg !76

sink:                                             ; preds = %entry
  call void @llvm.dbg.label(metadata !77), !dbg !78
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !79, metadata !DIExpression()), !dbg !81
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !82
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !83
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !84
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !84
  %1 = bitcast i8* %0 to i32*, !dbg !85
  call void @printWLine(i32* %1), !dbg !86
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !87
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !88
  %2 = bitcast i32* %arraydecay to i8*, !dbg !88
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !88
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !89
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !90
  store i32 0, i32* %arrayidx, align 4, !dbg !91
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !92
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !93
  call void @printWLine(i32* %arraydecay4), !dbg !94
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !95
  %3 = load i8*, i8** %voidSecond5, align 8, !dbg !95
  %4 = bitcast i8* %3 to i32*, !dbg !96
  call void @printWLine(i32* %4), !dbg !97
  ret void, !dbg !98
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_18.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_18_bad", scope: !17, file: !17, line: 34, type: !18, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_18.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocation(line: 36, column: 5, scope: !16)
!21 = !DILabel(scope: !16, name: "sink", file: !17, line: 37)
!22 = !DILocation(line: 37, column: 1, scope: !16)
!23 = !DILocalVariable(name: "structCharVoid", scope: !24, file: !17, line: 39, type: !25)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 38, column: 5)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !17, line: 30, baseType: !26)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !17, line: 25, size: 640, elements: !27)
!27 = !{!28, !32, !33}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !26, file: !17, line: 27, baseType: !29, size: 512)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 512, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 16)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !26, file: !17, line: 28, baseType: !4, size: 64, offset: 512)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !26, file: !17, line: 29, baseType: !4, size: 64, offset: 576)
!34 = !DILocation(line: 39, column: 18, scope: !24)
!35 = !DILocation(line: 40, column: 24, scope: !24)
!36 = !DILocation(line: 40, column: 35, scope: !24)
!37 = !DILocation(line: 42, column: 46, scope: !24)
!38 = !DILocation(line: 42, column: 20, scope: !24)
!39 = !DILocation(line: 42, column: 9, scope: !24)
!40 = !DILocation(line: 44, column: 31, scope: !24)
!41 = !DILocation(line: 44, column: 9, scope: !24)
!42 = !DILocation(line: 45, column: 24, scope: !24)
!43 = !DILocation(line: 45, column: 9, scope: !24)
!44 = !DILocation(line: 45, column: 88, scope: !24)
!45 = !DILocation(line: 46, column: 46, scope: !24)
!46 = !DILocation(line: 46, column: 31, scope: !24)
!47 = !DILocation(line: 46, column: 9, scope: !24)
!48 = !DILocation(line: 47, column: 46, scope: !24)
!49 = !DILocation(line: 47, column: 20, scope: !24)
!50 = !DILocation(line: 47, column: 9, scope: !24)
!51 = !DILocation(line: 49, column: 1, scope: !16)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_18_good", scope: !17, file: !17, line: 73, type: !18, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 75, column: 5, scope: !52)
!54 = !DILocation(line: 76, column: 1, scope: !52)
!55 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 87, type: !56, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!8, !8, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !17, line: 87, type: !8)
!62 = !DILocation(line: 87, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !17, line: 87, type: !58)
!64 = !DILocation(line: 87, column: 27, scope: !55)
!65 = !DILocation(line: 90, column: 22, scope: !55)
!66 = !DILocation(line: 90, column: 12, scope: !55)
!67 = !DILocation(line: 90, column: 5, scope: !55)
!68 = !DILocation(line: 92, column: 5, scope: !55)
!69 = !DILocation(line: 93, column: 5, scope: !55)
!70 = !DILocation(line: 94, column: 5, scope: !55)
!71 = !DILocation(line: 97, column: 5, scope: !55)
!72 = !DILocation(line: 98, column: 5, scope: !55)
!73 = !DILocation(line: 99, column: 5, scope: !55)
!74 = !DILocation(line: 101, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "good1", scope: !17, file: !17, line: 56, type: !18, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 58, column: 5, scope: !75)
!77 = !DILabel(scope: !75, name: "sink", file: !17, line: 59)
!78 = !DILocation(line: 59, column: 1, scope: !75)
!79 = !DILocalVariable(name: "structCharVoid", scope: !80, file: !17, line: 61, type: !25)
!80 = distinct !DILexicalBlock(scope: !75, file: !17, line: 60, column: 5)
!81 = !DILocation(line: 61, column: 18, scope: !80)
!82 = !DILocation(line: 62, column: 24, scope: !80)
!83 = !DILocation(line: 62, column: 35, scope: !80)
!84 = !DILocation(line: 64, column: 46, scope: !80)
!85 = !DILocation(line: 64, column: 20, scope: !80)
!86 = !DILocation(line: 64, column: 9, scope: !80)
!87 = !DILocation(line: 66, column: 31, scope: !80)
!88 = !DILocation(line: 66, column: 9, scope: !80)
!89 = !DILocation(line: 67, column: 24, scope: !80)
!90 = !DILocation(line: 67, column: 9, scope: !80)
!91 = !DILocation(line: 67, column: 88, scope: !80)
!92 = !DILocation(line: 68, column: 46, scope: !80)
!93 = !DILocation(line: 68, column: 31, scope: !80)
!94 = !DILocation(line: 68, column: 9, scope: !80)
!95 = !DILocation(line: 69, column: 46, scope: !80)
!96 = !DILocation(line: 69, column: 20, scope: !80)
!97 = !DILocation(line: 69, column: 9, scope: !80)
!98 = !DILocation(line: 71, column: 1, scope: !75)
